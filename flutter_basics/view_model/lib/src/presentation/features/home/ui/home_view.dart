// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:view_model/src/presentation/features/home/viewmodel/home_model.dart';
import 'package:view_model/src/presentation/widgets/observer_widget.dart';
import 'package:view_model/src/presentation/widgets/obsrver_formfield.dart';
import 'package:view_model/src/presentation/widgets/textformatter.dart';
import 'package:view_model/src/presentation/widgets/view_model.dart';

class HomeView extends ViewWidget<HomeModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeModel initModel() => HomeModel();

  @override
  // ignore: long-method
  Widget builder(BuildContext context, HomeModel model) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ObserverWidget(
                observable: model.count,
                builder: (context, int value) => Text(
                      '$value',
                      style: Theme.of(context).textTheme.headline4,
                    ),),
            ObserverFormField(
              observable: model.a,
              decoration: const InputDecoration(labelText: 'Int'),
            ),
            ObserverFormField(
              observable: model.b,
              decoration: const InputDecoration(labelText: 'Double'),
            ),
            ObserverFormField(
              observable: model.c,
              decoration: const InputDecoration(labelText: 'Double?'),
            ),
            ObserverFormField(
              observable: model.d,
              decoration: const InputDecoration(labelText: 'String'),
            ),
            ObserverFormField(
              observable: model.e,
              decoration: const InputDecoration(labelText: 'DateTime'),
            ),
            ObserverFormField(
              observable: model.f,
              decoration: const InputDecoration(labelText: 'DateTime?'),
            ),
            ObserverFormField(
              observable: model.g,
              decoration: const InputDecoration(labelText: 'Mask'),
              formatter: MaskTextFormatter(mask: '0000-####-####'),
            ),
            ObserverFormField(
              observable: model.h,
              decoration: const InputDecoration(labelText: 'Full DateTime'),
              formatter: DateTimeFormatter<DateTime>(
                  type: DateTimeFormatterType.dateFullTime,),
            ),
            ObserverFormField(
              observable: model.i,
              decoration: const InputDecoration(labelText: 'Required'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.add();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
