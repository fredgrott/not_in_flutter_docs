// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:reactive_viewmodel/src/infrastructure/reactivecomponents/reactive.dart';
import 'package:reactive_viewmodel/src/infrastructure/reactivecomponents/reactive_component.dart';
import 'package:reactive_viewmodel/src/infrastructure/reactivecomponents/reactive_sink.dart';

/// A counter which is a kind of [ReactiveComponent].
///
/// [ReactiveComponent] is a unit that encapsulates its members
/// and publicizes only [Sink]s and [Stream]s.
///
/// [ReactiveComponent] acts as a delegate to disposing its [ReactiveResource]s,
/// so that they should be disposed of together by [ReactiveComponent]'s
/// dispose method call.
class CounterBloc with ReactiveComponent {
  CounterBloc(this._initialCount);

  final int _initialCount;

  /// A special kind of [StreamSink] with its own single stream listener
  /// that handles for adding an event to increment this counter.
  ///
  /// The "increment();" is shorthand notation of "increment.add(null);".
  ///
  /// An event stream can be transformed by [_Transform] callback function
  /// passed at the constructor.
  ///
  /// "dispose()" action of [ReactiveSink] can be delegated to
  /// [ReactiveComponent]'s disposer.
  ///
  /// For more information, see [ReactiveSink]'s API documentation.
  late final VoidReactiveSink increment = VoidReactiveSink(
    () {
      // Increments _count on a increment event is delivered.
      _count.data++;
    },
    disposer: disposer,
  );

  /// A [Reactive], [int] data as count state of this counter.
  ///
  /// [Reactive] is a special kind of [StreamController] that holds its latest
  /// stream data, and sends that as the first data to any new listener.
  ///
  /// For more information, see [Reactive]'s API documentation.
  late final Reactive<int> _count =
      Reactive<int>(_initialCount, disposer: disposer);

  /// Publicize only the stream of [_count] to hide its data mutating
  /// and the other behaviors.
  /// It's a good point to transform the stream as necessary.
  Stream<int> get count => _count.stream;
}
