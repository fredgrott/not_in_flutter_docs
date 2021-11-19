// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modification of the Floater pacakge which was
// created by Shrey Mahendru under mIT License

import 'dart:async';

/// Mutual Exclusion Lock
/// Used to protect critical section of the code in order to avoid race conditions.
/// It ensures FIFO lock accusation.
/// Every acquirer gets the lock in order of when they asked for it,
/// given it is released by the previous acquirer, if there is no previous acquirer then lock is acquired right away
///
/// Example:
///
/// ```dart
/// class _Synchronized {
///  final _mutex = new Mutex();
///
///  final _values = new List<int>();
///  List<int> get values => this._values;
///
///  Future<void> execute(int milliseconds) async {
///    await this._mutex.lock();
///    try {
///      await Future.delayed(Duration(milliseconds: milliseconds));
///      this._values.add(milliseconds);
///    } finally {
///      this._mutex.release();
///    }
///  }
///}
///  final synchronized = new _Synchronized();
///  final delays = List.generate(5, (index) => index * 1000).reversed;
///  final futures = delays.map((t) => synchronized.execute(t));
///  await Future.wait(futures);
///  print(synchronized.value)
/// ```
/// The above code will print `[4000, 3000, 2000, 1000, 0]`

class Mutex {
  final List<Completer<void>> _waitingAcquirers = [];
  Completer<void>? _currentAcquirer;

  Future<void> lock() {
    final completer = Completer<void>();

    _waitingAcquirers.add(completer);
    // let the first one pass
    if (_waitingAcquirers.length == 1) {
      _currentAcquirer = completer;
      _currentAcquirer?.complete();
    }

    return completer.future;
  }

  void release() {
    if (_currentAcquirer == null) return;

    _waitingAcquirers.remove(_currentAcquirer);

    // when released by the current acquirer, let the next one pass if any.
    if (_waitingAcquirers.isNotEmpty) {
      _currentAcquirer = _waitingAcquirers.first;
      _currentAcquirer?.complete();
    } else {
      _currentAcquirer = null;
    }
  }
}
