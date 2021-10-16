// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lid/flutter_lid.dart';
import 'package:state_notifier_viewmodel/src/presentation/features/home/viewcontroller/counterstate.dart';

class CounterPage extends StatelessWidget {
  CounterPage({Key? key}) : super(key: key);

  final _counter = CounterState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lid Counter')),
      body: LidBuilder<int>(
        stateNotifier: _counter,
        builder: (_, count) {
          return Center(
            child: Text(
              '$count',
              style: Theme.of(context).textTheme.headline1,
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: FloatingActionButton(
              onPressed: () => _counter.increment(),
              child: const Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: FloatingActionButton(
              onPressed: () => _counter.decrement(),
              child: const Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}
