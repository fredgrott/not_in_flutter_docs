// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';



import 'package:getit_fullmetal/src/infrastructure/getit/service_locator.dart';
import 'package:rxdart/rxdart.dart';

/// Event Aggregator
/// Used to propagate app specific events through out the App. Widgets, State and/or Services can consume the events published.
///
/// Specific type of event can be subscribed with: `eventAggregator.subscribe<IntEventA>()`
/// If no type is provided, the subscriber gets all the events.
///
/// Example:
/// ```dart
/// class IntEvent {
///   final int value;
///   IntEvent(this.value);
/// }
///
/// final ea = EventAggregator();
///
/// ea.subscribe<IntEventA>().listen((event) {
///   print(event.value);
/// })
///
/// ea.publish(IntEvent(1));
/// ea.publish(ArbitraryEvent());
/// ```
///
/// The above code prints `1` cause of the first event, and the listener doesn't receive `ArbitraryEvent()`

abstract class EventAggregator implements Disposable {
  Stream<T> subscribe<T>();
  void publish<T>(T event);
}

class FloaterEventAggregator implements EventAggregator {
  final PublishSubject<dynamic> _eventPublishSubject = PublishSubject<dynamic>();
  final Map<Type, Stream<dynamic>> _streamCache = {};

  bool _isDisposed = false;

  /// Subscribe to an event of a specific type.
  /// If no type is provided, the subscriber receives all the event published
  @override
  Stream<T> subscribe<T>() {
    if (_isDisposed) throw Exception("Object disposed");

    _streamCache[T] ??= _eventPublishSubject.stream.whereType<T>();
    
    // ignore: cast_nullable_to_non_nullable
    return _streamCache[T] as Stream<T>;
  }

  /// Publish an new event.
  @override
  void publish<T>(T event) {
    // given(event, "event").ensureHasValue();

    if (_isDisposed) throw Exception("Object disposed");

    _eventPublishSubject.add(event);
  }

  @override
  void dispose() {
    if (_isDisposed) return;

    _isDisposed = true;
    unawaited(_eventPublishSubject.close());
    _streamCache.clear();
  }
}
