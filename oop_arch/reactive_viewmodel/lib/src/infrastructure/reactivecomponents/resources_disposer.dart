// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

//
// Original was by nato of polyreflection BSD license clause 3
// copyright 2020

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:reactive_viewmodel/src/infrastructure/reactivecomponents/sinks.dart';



/// An object to handle resource disposing.
class ResourceDisposer {
  /// Constructs resource disposer.
  ResourceDisposer({
    required Future<void> Function()? doDispose,
    required VoidCallback? onDispose,
  })  : _doDispose = doDispose,
        _onDispose = onDispose;

  /// A [VoidSink] to dispose of the resources.
  VoidSink get dispose {
    return _VoidSink(
      _disposeController.sink,
      () => !_isDisposeEventSent,
      _wrapOnDispose(_onDispose),
    );
  }

  /// A stream to notify the resource has been disposed of.
  Stream<void> get disposed => Stream.fromFuture(_disposeController.done);

  /// Check whether an event data has been added to [dispose] sink once.
  ///
  /// It is synchronously set to true on an event data added.
  bool get isDisposeEventSent => _isDisposeEventSent;

  /// Registers a resource disposer for disposing of together.
  ///
  /// If [isDisposeEventSent] is true, then the resource disposer calls
  /// dispose method immediately.
  void register(ResourceDisposer disposer) {
    if (isDisposeEventSent) {
      disposer.dispose();
    } else {
      _disposers.add(disposer);
    }
  }

  /// Delegates its [dispose] call to [disposerDelegate].
  void delegateDisposingTo(ResourceDisposer disposerDelegate) {
    disposerDelegate.register(this);
  }

  final Future<void> Function()? _doDispose;
  final List<ResourceDisposer> _disposers = [];

  StreamController<void>? __disposeController;
  StreamController<void> get _disposeController => __disposeController ??=
      StreamController<void>()..stream.listen((_) => _dispose());

  Future<void>? _dispose() => _doDispose != null
      // ignore: cast_nullable_to_non_nullable
      ? Future.wait<dynamic>(
          [_doDispose!(), _disposePrivateResource()!],)
      : _disposePrivateResource();

  Future<void>? _disposePrivateResource() => _disposeController.close();

  final VoidCallback? _onDispose;

  VoidCallback _wrapOnDispose(VoidCallback? onDispose) {
    return () {
      if (_isDisposeEventSent) return;
      _isDisposeEventSent = true;
      for (final disposer in _disposers) {
        disposer.dispose();
      }
      onDispose?.call();
    };
  }

  bool _isDisposeEventSent = false;
}

class _VoidSink implements VoidSink {
  _VoidSink(this._sink, this._canAdd, this._onAdd);

  final Sink<dynamic> _sink;
  final bool Function() _canAdd;
  final VoidCallback _onAdd;

  @override
  void call() {
    if (_canAdd()) {
      _sink.add(null);
      _onAdd();
    }
  }

  @override
  void add(void _) {
    call();
  }

  @override
  void close() {
    call();
  }
}
