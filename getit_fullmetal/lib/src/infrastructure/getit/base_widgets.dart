// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: use_setters_to_change_properties

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';


@immutable
abstract class StatelessWidgetBase extends StatelessWidget {
  const StatelessWidgetBase({
    Key? key,
  }) : super(key: key);
}

@immutable
// ignore: prefer-single-widget-per-file
abstract class StatefulWidgetBase<T extends WidgetStateBase>
    extends StatefulWidget {
  final T Function() _createState;
  final List<T> _stateHolder = <T>[];

  @protected
  T get state => _stateHolder.first;

  StatefulWidgetBase(T Function() createState, {Key? key,})
      : _createState = createState,
        super(key: key);

  @override
  @nonVirtual
  // ignore: no_logic_in_create_state
  T createState() => _createState();

  Widget build(BuildContext context);

  void _setState(T state) {
    if (_stateHolder.isEmpty) {
      _stateHolder.add(state);
    } else {
      _stateHolder.first = state;
    }
  }
}

abstract class WidgetStateBase<T extends StatefulWidget> extends State<T> {
  final _watches = <Stream<dynamic>, StreamSubscription<dynamic>>{};
  final _listeners = <Listenable, void Function()>{};
  bool _isInitialized = false;

  VoidCallback? _onInitState;
  VoidCallback? _onDeactivate;
  VoidCallback? _onDispose;
  VoidCallback? _onStateChange;

  bool _isDisposed = false;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  
  @protected
  @nonVirtual
  bool get isDisposed => _isDisposed;

  @override
  @protected
  @nonVirtual
  @mustCallSuper
  void initState() {
    super.initState();

    _isInitialized = true;
    if (_onInitState != null) _onInitState!();
  }

  @protected
  @nonVirtual
  @mustCallSuper
  void onInitState(VoidCallback callback) {
    // given(callback, "callback").ensureHasValue();
    _onInitState = callback;
  }

  @override
  @protected
  @nonVirtual
  @mustCallSuper
  void setState([VoidCallback? fn]) {
    if (fn != null) fn();
    if (_onStateChange != null) _onStateChange!();
    if (!_isInitialized) return;
    if (_isDisposed) return;
    super.setState(() {});
  }

  @override
  @protected
  @nonVirtual
  @mustCallSuper
  void deactivate() {
    if (_onDeactivate != null) _onDeactivate!();

    super.deactivate();
  }

  @protected
  @nonVirtual
  @mustCallSuper
  void onDeactivate(VoidCallback callback) {
    _onDeactivate = callback;
  }

  @override
  @protected
  @nonVirtual
  @mustCallSuper
  void dispose() {
    _isDisposed = true;
    for (final watcher in _watches.values) {
      watcher.cancel();
    }
    _watches.clear();

    for (final listenable in _listeners.keys) {
      unlisten(listenable);
    }

    if (_onDispose != null) _onDispose!();

    super.dispose();
  }

  @protected
  @nonVirtual
  @mustCallSuper
  void onDispose(VoidCallback callback) {
    _onDispose = callback;
  }

  @protected
  @nonVirtual
  @mustCallSuper
  void triggerStateChange() {
    setState(() {});
  }

  @protected
  @nonVirtual
  @mustCallSuper
  void onStateChange(VoidCallback callback) {
    _onStateChange = callback;
  }

  @protected
  @nonVirtual
  @mustCallSuper
  void watch<U>(Stream<U> stream, [FutureOr<void> Function(U data)? onData,]) {
    if (_watches.containsKey(stream)) return;
    onData ??= (U data) {};
    _watches[stream] = stream.listen((event) async {
      await onData!(event);
      triggerStateChange();
    });
  }

  @protected
  @nonVirtual
  @mustCallSuper
  void unwatch(Stream<dynamic> stream) {
    if (!_watches.containsKey(stream)) return;
    final dynamic watcher = _watches[stream];
    _watches.remove(stream);
    watcher.cancel();
  }

  @protected
  @nonVirtual
  @mustCallSuper
  // ignore: avoid_shadowing_type_parameters
  void listen<T extends Listenable>(T listenable, void Function() onChange,) {
    if (_listeners.containsKey(listenable)) {
      throw Exception("Listenable $listenable already being listened to");
    }

    _listeners[listenable] = onChange;
    listenable.addListener(onChange);
  }

  @protected
  @nonVirtual
  @mustCallSuper
  // ignore: avoid_shadowing_type_parameters
  void unlisten<T extends Listenable>(T listenable) {
    if (!_listeners.containsKey(listenable)) return;

    final listener = _listeners.remove(listenable);
    listenable.removeListener(listener!);
  }

  @override
  @protected
  @nonVirtual
  @mustCallSuper
  Widget build(BuildContext context) {
    final widget = this.widget as StatefulWidgetBase;
    widget._setState(this);

    return widget.build(context);
  }

  @protected
  @mustCallSuper
  void showLoading() {
    _isLoading = true;
    triggerStateChange();
  }

  @protected
  @mustCallSuper
  void hideLoading() {
    _isLoading = false;
    triggerStateChange();
  }
}

/// For clients of AutomaticKeepAlive (example: ListView).
/// This keeps the state of a widget alive, given the wantAlive is set to true.
abstract class KeepAliveClientWidgetStateBase<T extends StatefulWidget>
    extends WidgetStateBase<T> with AutomaticKeepAliveClientMixin {
  bool _keepAlive = true;

  @override
  @protected
  @nonVirtual
  bool get wantKeepAlive => _keepAlive;

  @protected
  @nonVirtual
  set wantKeepAlive(bool value) {
    _keepAlive = value;
    super.updateKeepAlive();
  }

  @override
  @protected
  @nonVirtual
  @mustCallSuper
  Widget build(BuildContext context) {
    super.build(context);
    final widget = this.widget as StatefulWidgetBase;
    widget._setState(this);
    
    return widget.build(context);
  }
}
