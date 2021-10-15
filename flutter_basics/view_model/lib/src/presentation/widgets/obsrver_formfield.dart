// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
//  Original MIT license Copyright (c) 2020 hientrung
// Modified

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:obsobject/obsobject.dart';
import 'package:view_model/src/presentation/widgets/observer_widget.dart';
import 'package:view_model/src/presentation/widgets/textformatter.dart';

///An input to enter value for observable string or number or datetime.
///
///Validation on lost focus or instant validate if it already validated
class ObserverFormField<T> extends FormField<T> {
  ///Current observable value
  final ObservableBase<T> observable;

  ///Text input type, if null it will use default type base on value type
  final TextInputType? keyboardType;

  ///Handler format display value
  final TextFormatter<T>? formatter;

  ///Create new form field for an observable
  // ignore: long-method
  ObserverFormField({
    required this.observable,
    this.formatter,
    Key? key,
    InputDecoration decoration = const InputDecoration(),
    this.keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction textInputAction = TextInputAction.none,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextDirection textDirection = TextDirection.ltr,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    ToolbarOptions? toolbarOptions,
    bool showCursor = true,
    bool obscureText = false,
    bool autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    ValueChanged<T>? onChanged,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<T>? onSaved,
    bool enabled = true,
    double cursorWidth = 2.0,
    Radius? cursorRadius,
    Color? cursorColor,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool enableInteractiveSelection = true,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
  }) : super(
          key: key,
          initialValue: observable.value,
          onSaved: onSaved,
          enabled: enabled,
          builder: (field) {
            final state = field as _ObserverFormFieldState<T>;
            final effectiveDecoration = (decoration)
                .applyDefaults(Theme.of(state.context).inputDecorationTheme);
            state._controller.text = state._getText(observable.value);
            
            return ObserverWidget<String?>(
                observable: Computed(() {
                  observable.value; //depend

                  return state.hasError ? state.errorText : null;
                }),
                builder: (BuildContext context, String?  err) => TextField(
                      controller: state._controller,
                      focusNode: state._node,
                      decoration: effectiveDecoration.copyWith(errorText: err),
                      keyboardType: state._keyboardType,
                      textInputAction: textInputAction,
                      style: style,
                      strutStyle: strutStyle,
                      textAlign: textAlign,
                      textAlignVertical: textAlignVertical,
                      textDirection: textDirection,
                      textCapitalization: textCapitalization,
                      autofocus: autofocus,
                      toolbarOptions: toolbarOptions,
                      readOnly: readOnly && observable is ObservableWritable,
                      showCursor: showCursor,
                      obscureText: obscureText,
                      autocorrect: autocorrect,
                      smartDashesType: smartDashesType ??
                          (obscureText
                              ? SmartDashesType.disabled
                              : SmartDashesType.enabled),
                      smartQuotesType: smartQuotesType ??
                          (obscureText
                              ? SmartQuotesType.disabled
                              : SmartQuotesType.enabled),
                      enableSuggestions: enableSuggestions,
                      maxLines: maxLines,
                      minLines: minLines,
                      expands: expands,
                      maxLength: maxLength,
                      onChanged: (val) {
                        if (state._formatter.isValid(val)) {
                          final T v = state._getValue(val) as T;
                          if (observable is ObservableWritable<T> && v is T) {
                            state._updating = true;
                            observable.value = v;
                          }
                          onChanged?.call(v);
                        }
                      },
                      onTap: onTap,
                      onEditingComplete: onEditingComplete,
                      onSubmitted: onFieldSubmitted,
                      inputFormatters: <TextInputFormatter>[state._formatter],
                      enabled: enabled,
                      cursorWidth: cursorWidth,
                      cursorRadius: cursorRadius,
                      cursorColor: cursorColor,
                      scrollPadding: scrollPadding,
                      scrollPhysics: scrollPhysics,
                      keyboardAppearance: keyboardAppearance,
                      enableInteractiveSelection: enableInteractiveSelection,
                      buildCounter: buildCounter,
                    ),);
          },
        );

  @override
  FormFieldState<T> createState() => _ObserverFormFieldState<T>();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('value', observable.peek));
  }
}

class _ObserverFormFieldState<T> extends FormFieldState<T> {
  ///handle focus
  late FocusNode _node;

  ///should validate value or not
  var _mustValidate = false;

  ///listen on observable value changed
  Subscription? _subChanged;

  ///handle text of text field
  late TextEditingController _controller;

  ///Set current update observable is internally to avoid rebuild widget
  bool _updating = false;

  ///set default input type
  TextInputType? _keyboardType;

  ///current formatter
  late TextFormatter<dynamic> _formatter;

  @override
  // ignore: long-method
  void initState() {
    super.initState();
    //current formatter
    if (widget.formatter != null) {
      _formatter = widget.formatter!;
    } else {
      switch (T.toString()) {
        case 'int':
          _formatter = NumberTextFormatter<int>();
          break;
        case 'int?':
          _formatter = NumberTextFormatter<int?>();
          break;
        case 'double':
          _formatter = NumberTextFormatter<double>(
            fraction: 2,
          );
          break;
        case 'double?':
          _formatter = NumberTextFormatter<double?>(
            fraction: 2,
          );
          break;
        case 'String':
          _formatter = StringTextFormatter();
          break;
        case 'DateTime':
          _formatter = DateTimeFormatter<DateTime>();
          break;
        case 'DateTime?':
          _formatter = DateTimeFormatter<DateTime?>();
          break;
        default:
          throw UnimplementedError('Should provide formatter for text input');
      }
    }
    //current text controller
    _controller =
        TextEditingController(text: _getText(widget.observable.value));

    //default input type
    if (widget.keyboardType != null) {
      _keyboardType = widget.keyboardType;
    } else {
      switch (T.toString()) {
        case 'int':
        case 'int?':
          _keyboardType = TextInputType.number;
          break;
        case 'double':
        case 'double?':
          _keyboardType = const TextInputType.numberWithOptions(decimal: true);
          break;
        case 'DateTime':
        case 'DateTime?':
          _keyboardType = TextInputType.datetime;
          break;
      }
    }

    _node = FocusNode();
    _node.addListener(() {
      //validate on lost focus
      //or reformat maybe invalid or format value don't same (eg: datetime)
      if (!_node.hasFocus) {
        if (widget.observable.hasValidator && !_mustValidate) {
          _mustValidate = true;
          widget.observable.notify();
        } else {
          _controller.text = _getText(widget.observable.value);
        }
      }
    });

    //if observable has validate, setup handlers
    if (widget.observable.hasValidator) {
      //changed outside
      _subChanged = widget.observable.changed(() {
        if (!_updating) {
          setState(() {
            _controller.text = _getText(widget.observable.value);
          });
        } else {
          _updating = false;
        }
      });
    }
  }

  @override
  void reset() {
    //already call rebuild
    if (widget.observable is ObservableWritable) {
      _updating = true;
      (widget.observable as ObservableWritable).value = widget.initialValue;
    }
    _mustValidate = false;
    _controller.text = _getText(widget.observable.value);
  }

  @override
  ObserverFormField<T> get widget => super.widget as ObserverFormField<T>;

  @override
  bool validate() {
    //already call rebuild
    _mustValidate = true;

    // ignore: avoid_bool_literals_in_conditional_expressions
    return widget.observable.hasValidator ? widget.observable.isValid.value : true;
  }

  @override
  String? get errorText => hasError ? widget.observable.isValid.message : null;

  @override
  T get value => widget.observable.value;

  @override
  // ignore: avoid_bool_literals_in_conditional_expressions
  bool get hasError => widget.observable.hasValidator && _mustValidate
      ? !widget.observable.isValid.value
      : false;

  @override
  // ignore: avoid_bool_literals_in_conditional_expressions
  bool get isValid => widget.observable.hasValidator
      ? widget.observable.isValid.validator!.validate(value) != null
      : true;

  @override
  void dispose() {
    _node.dispose();
    _subChanged?.dispose();
    _controller.dispose();
    super.dispose();
  }

  ///Convert value to string
  String _getText(dynamic value) {
    return _formatter.format(value);
  }

  ///Parse string to value
  dynamic _getValue(String text) {
    return _formatter.parse(text);
  }
}
