// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
//  Original MIT license Copyright (c) 2020 hientrung
// Modified

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:obsobject/obsobject.dart';

///An observer of observables to update widget by an asynchronous processing
///after all changed done
class ObserverWidget<T> extends StatefulWidget {
  ///The function use to build widget
  final Widget Function(BuildContext context, T value) builder;

  ///Listening on an observable
  final ObservableBase<T> observable;

  ///Create an observer widget
  const ObserverWidget(
      {Key? key, required this.observable, required this.builder,})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ObserverWidgetState<T>();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('observable', observable.peek));
  }
}

class _ObserverWidgetState<T> extends State<ObserverWidget<T>> {
  late Subscription _subscription;

  @override
  Widget build(BuildContext context) =>
      widget.builder(context, widget.observable.peek);

  @override
  void initState() {
    super.initState();
    // ignore: no-empty-block
    _subscription = widget.observable.changed(() => setState(() {}));
  }

  @override
  void dispose() {
    _subscription.dispose();
    super.dispose();
  }
}
