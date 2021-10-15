// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
//  Original MIT license Copyright (c) 2020 hientrung
// Modified

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

///Base class used for text with format/parser
abstract class TextFormatter<T> extends TextInputFormatter {
  ///Format value to text
  String format(T value);

  ///Parser text to value
  T parse(String text);

  ///Check current text is valid to parse or not
  bool isValid(String text);
}

///Process for a plain string
class StringTextFormatter extends TextFormatter<String> {
  @override
  String format(String value) {
    return value;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue,) {
    return newValue;
  }

  @override
  bool isValid(String text) {
    return true;
  }

  @override
  String parse(String text) {
    return text;
  }
}

///Process format number while typing
class NumberTextFormatter<T extends num?> extends TextFormatter<T> {
  ///Current locale
  final String? locale;

  ///Number of fraction allowed
  final int fraction;

  ///Current number formatter
  late NumberFormat numberFormat;
  String _last = '';
  late String _decimal;
  late String _thousand;
  late RegExp _regex;
  final _type = T.toString();

  ///Create number formatter used for TextInput
  NumberTextFormatter({this.fraction = 0, this.locale}) {
    if ((_type == 'int' || _type == 'int?') && fraction > 0) {
      throw Exception("Integer don't accept fraction number");
    }
    //format decimal number
    var s = '#,##0';
    if (fraction > 0) {
      s += '.'.padRight(fraction + 1, '#');
    }
    numberFormat = NumberFormat(s, locale);
    _decimal = numberFormat.symbols.DECIMAL_SEP;
    _thousand = numberFormat.symbols.GROUP_SEP;
    _regex = fraction > 0 ? RegExp('^\\d+(?:\\.\\d{0,$fraction})?\$') : RegExp(r'^\d+$');
  }

  @override
  // ignore: long-method
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue,) {
    if (newValue.text == _last) {
      return oldValue;
    }
    if (newValue.text.isEmpty) {
      if (null is! T) {
        _last = '0';

        return TextEditingValue(
            text: _last, selection: const TextSelection.collapsed(offset: 1),);
      } else {
        _last = newValue.text;

        return newValue;
      }
    }

    var text = newValue.text.replaceAll(_thousand, '');
    if (_decimal != '.') {
      text = text.replaceAll(_decimal, '.');
    }
    if (!_regex.hasMatch(text)) {
      return oldValue;
    }

    //convert to number
    num number = 0;
    switch (_type) {
      case 'int':
      case 'int?':
        number = int.tryParse(text) ?? 0;
        break;
      case 'double':
      case 'double?':
        number = double.tryParse(text) ?? 0;
        break;
      default:
        throw UnimplementedError();
    }
    text = numberFormat.format(number).trim();
    if (newValue.text.endsWith(_decimal) && !text.contains(_decimal)) {
      text += _decimal;
    }

    //current cursor
    final m = RegExp('[\\d\\$_decimal]');
    var old = 0;
    for (var i = 0; i < newValue.selection.end; i++) {
      if (m.hasMatch(newValue.text[i])) {
        old++;
      }
    }

    var ind = 0;
    var cur = 0;
    for (var i = 0; i < text.length && ind < old; i++) {
      if (m.hasMatch(text[i])) ind++;
      cur++;
    }

    _last = text;
    
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: cur),
    );
  }

  @override
  String format(T value) {
    if (value == null) {
      return value is T ? '' : '0';
    }

    return numberFormat.format(value);
  }

  @override
  T parse(String text) {
    if (text.isEmpty) {
      return null is T ? null as T : 0 as T;
    }

    return numberFormat.parse(text) as T;
  }

  @override
  bool isValid(String text) {
    if (text.isEmpty) {
      return true;
    } else {
      try {
        numberFormat.parse(text);

        return true;
      } on FormatException {
        return false;
      }
    }
  }
}

///Handler format string by a masked text,
///used to parse to other value type of TextFormatter
class _StringFormat {
  final String mask;
  final Map<String, RegExp> keys;
  final String holder;
  final bool includeLiteral;

  _StringFormat({
    required this.mask,
    required this.keys,
    this.holder = '_',
    this.includeLiteral = false,
  });

  TextEditingValue formatEdit(TextEditingValue value) {
    if (value.text.isEmpty) {
      return value;
    }

    //override text if can
    var text = value.text.length <= mask.length
        ? value.text
        : value.text.substring(0, mask.length + 1);
    //array regexp to check characters
    final arr = <RegExp>[];
    for (var i = 0; i < mask.length; i++) {
      if (keys.containsKey(mask[i])) {
        arr.add(keys[mask[i]]!);
      }
    }

    //get raw text, position
    var raw = '';
    var ind = 0;
    var pos = 0;
    for (var i = 0; i < text.length && ind < arr.length; i++) {
      if (text[i].contains(arr[ind])) {
        ind++;
        raw += text[i];
        if (i < value.selection.end) {
          pos++;
        }
      }
    }

    //format text and current position
    text = format(raw);
    var cur = 0;
    ind = 0;
    for (var i = 0; i < mask.length && ind < pos; i++) {
      if (keys.containsKey(mask[i])) {
        ind++;
      }
      cur++;
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: cur),
    );
  }

  ///Check current text editing is valid or not
  bool isValid(String text) {
    if (text.isEmpty || text == format('')) {
      return true;
    }
    if (text.length != mask.length) {
      return false;
    }
    for (var i = 0; i < mask.length; i++) {
      if (keys.containsKey(mask[i]) && !text[i].contains(keys[mask[i]]!)) {
        return false;
      }
    }

    return true;
  }

  ///Format raw text to masked text
  String format(String value) {
    var s = '';
    var c = 0;
    for (var i = 0; i < mask.length; i++) {
      if (keys.containsKey(mask[i])) {
        if (c > -1 && c < value.length) {
          if (value[c].contains(keys[mask[i]]!)) {
            s += value[c];
            c++;
          } else {
            s += holder;
            c = -1; //invalid mask
          }
        } else {
          s += holder;
        }
      } else {
        s += mask[i];
        if (includeLiteral) {
          c++;
        }
      }
    }

    return s;
  }

  ///Parse masked text to raw text
  String parse(String text) {
    if (text.isEmpty || !isValid(text)) {
      return '';
    }
    var s = '';
    for (var i = 0; i < mask.length; i++) {
      if (keys.containsKey(mask[i])) {
        if (i < text.length && text[i].contains(keys[mask[i]]!)) {
          s += text[i];
        } else {
          //invalid, maybe change mask
          return '';
        }
      } else {
        if (includeLiteral) {
          s += mask[i];
        }
      }
    }

    return s;
  }
}

///Process format masked text
///
///Default [keys] use the following wildcard characters
///- \* : any character
///- 0 : number only, 0-9
///- A : letter only, a-zA-Z
///- \# : number or letter
class MaskTextFormatter extends TextFormatter<String> {
  final _StringFormat _fm;

  ///Create a mask text input
  MaskTextFormatter({
    required String mask,
    Map<String, RegExp>? keys,
    String holder = '_',
    bool includeLiteral = false,
  }) : _fm = _StringFormat(
          mask: mask,
          keys: keys ??
              <String, RegExp>{
                // ignore: unnecessary_raw_strings
                '*': RegExp(r'.'),
                // ignore: unnecessary_raw_strings
                '0': RegExp(r'[0-9]'),
                // ignore: unnecessary_raw_strings
                'A': RegExp(r'[a-zA-Z]'),
                // ignore: unnecessary_raw_strings
                '#': RegExp(r'[0-9a-zA-Z]'),
              },
          holder: holder,
          includeLiteral: includeLiteral,
        );

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue,) {
    if (newValue.text == oldValue.text) return newValue;

    return _fm.formatEdit(newValue);
  }

  @override
  String format(String value) => _fm.format(value);

  @override
  String parse(String text) => _fm.parse(text);

  @override
  bool isValid(String text) => _fm.isValid(text);
}

///Used to handle DateTimeFormatter
enum DateTimeFormatterType {
  ///Date part only
  date,

  ///Date part with hour, minute
  dateShortTime,

  ///Date and time
  dateFullTime,
}

///Process format DateTime
class DateTimeFormatter<T extends DateTime?> extends TextFormatter<T> {
  ///Type mask typing
  final DateTimeFormatterType type;

  ///Current Locale use to format
  final String? locale;

  late _StringFormat _fm;
  late DateFormat _dateFormat;

  ///Create a date/time text input
  DateTimeFormatter({this.type = DateTimeFormatterType.date, this.locale}) {
    final d = DateFormat.yMd(locale);
    switch (type) {
      case DateTimeFormatterType.date:
        _dateFormat = d;
        break;
      case DateTimeFormatterType.dateShortTime:
        _dateFormat = d.add_Hm();
        break;
      case DateTimeFormatterType.dateFullTime:
        _dateFormat = d.add_Hms();
        break;
    }
    var s = _dateFormat.pattern!;
    //rewrite format use full digit
    s = s
        // ignore: unnecessary_raw_strings
        .replaceAll(RegExp(r'y+'), 'yyyy')
        // ignore: unnecessary_raw_strings
        .replaceAll(RegExp(r'M+'), 'MM')
        // ignore: unnecessary_raw_strings
        .replaceAll(RegExp(r'd+'), 'dd')
        // ignore: unnecessary_raw_strings
        .replaceAll(RegExp(r'H+'), 'HH')
        // ignore: unnecessary_raw_strings
        .replaceAll(RegExp(r'j+'), 'HH')
        // ignore: unnecessary_raw_strings
        .replaceAll(RegExp(r'm+'), 'mm')
        // ignore: unnecessary_raw_strings
        .replaceAll(RegExp(r's+'), 'ss');
    _dateFormat = DateFormat(s, locale);
    //rewrite masked text
    s = s
        // ignore: unnecessary_raw_strings
        .replaceAll(RegExp(r'y+'), '0000')
        // ignore: unnecessary_raw_strings
        .replaceAll(RegExp(r'M+'), '00')
        // ignore: unnecessary_raw_strings
        .replaceAll(RegExp(r'd+'), '00')
        // ignore: unnecessary_raw_strings
        .replaceAll(RegExp(r'H+'), '00')
        // ignore: unnecessary_raw_strings
        .replaceAll(RegExp(r'm+'), '00')
        // ignore: unnecessary_raw_strings
        .replaceAll(RegExp(r's+'), '00');
    // ignore: unnecessary_raw_strings
    _fm = _StringFormat(mask: s, keys: <String, RegExp>{'0': RegExp(r'[0-9]')});
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue,) {
    if (oldValue.text == newValue.text) {
      return newValue;
    }
    
    return _fm.formatEdit(newValue);
  }

  @override
  bool isValid(String text) {
    return text.isEmpty || text == _fm.format('') ? null is T : _fm.isValid(text);
  }

  @override
  String format(T value) {
    if (value == null) {
      return _fm.format('');
    }
    
    return _dateFormat.format(value);
  }

  @override
  T parse(String text) {
    if ((text.isEmpty || text == _fm.format('')) && null is T) {
      return null as T;
    }

    return _dateFormat.parse(text) as T;
  }
}
