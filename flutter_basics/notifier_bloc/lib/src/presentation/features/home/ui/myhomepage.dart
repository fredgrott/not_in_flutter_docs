// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notifier_bloc/src/presentation/features/home/viewcontroller/main_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const style = TextStyle(
  fontSize: 80,
  fontWeight: FontWeight.bold,
);

class _MyHomePageState extends State<MyHomePage> {
  final myNotifier = MainNotifier();

  @override
  Widget build(BuildContext context) {
    log('rebuild...');

    return Scaffold(
      appBar: AppBar(
                title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
                'You have pushed the button this many times:',
              ),

            ValueListenableBuilder(
                valueListenable: myNotifier.notifierCounter,
                builder: (context, snapshot, _) {
                  log('rebuild text');
                  return Text(
                    '$snapshot',
                    style: style,
                  );
                },
              ),

              const SizedBox(height: 30),
              Container(
                height: 1,
                color: Colors.grey,
              ),
              ValueListenableBuilder(
                  valueListenable: myNotifier.notifierSlider,
                  child: const MyLogo(),
                  builder: (context, snapshot, child334324) {
                    log('rebuild slider');
                    return Column(
                      children: [
                        Text(
                          '${snapshot!.toString}',
                          style: style,
                        ),
                        // ignore: cast_nullable_to_non_nullable
                        child334324 as Widget,
                        Slider(
                          value: snapshot as double,
                          onChanged: myNotifier.sliderChanged,
                        ),
                      ],
                    );
                  }),

                  ValueListenableBuilder(
                       valueListenable: myNotifier.notifierCheck,
                       builder: (context, snapshot, _) {
                       log('rebuild checkbox');
                       return Checkbox(
                          value: snapshot as bool?,
                          onChanged: myNotifier.checkChanged,
                          );
                  }),
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: myNotifier.incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyLogo extends StatelessWidget {
  const MyLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('rebuild logo');
    return const FlutterLogo(
      size: 100,
    );
  }
}

class HorizontalListWidget extends StatelessWidget {
  const HorizontalListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
