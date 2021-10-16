// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original by GSkinner and Shawn Blais, article is at:
// https://blog.gskinner.com/archives/2020/02/flutter-widgetview-a-simple-separation-of-layout-and-logic.html
//

import 'package:flutter/widgets.dart';

//  bob NOVEMBER 27, 2020 AT 5:48PM
// Hey, I am trying to figure out the distinction between WidgetView design
// pattern and the MVC design pattern. Am I correct that this is similar to MVC
// design pattern since both are separating the model, view and controller?
// Please let me know if I am wrong on this, IÃ¢â‚¬â„¢m new to flutter and design
// pattern in general and have been reading up on different design patterns to
// try to learn the differences.
// Thank you.
//
// shawn.blais FEBRUARY 6, 2021 AT 5:52PM
// @bob Ã¢â‚¬â€œ In this case the State is pretty much playing dual roles of controller
// + model for the view, because it stores data about the view, and also has t
// he business logic to update that data. But you could certainly imagine another
// setup, where my view data is Provided from above, and the State would then act
// just as a View Controller.
// Most often itÃ¢â‚¬â„¢s a mix of the two in production. You will have some local state
// that can be thought of as the Ã¢ local model for that view, and then some
// app-level state that you also use.

// Note: Implementing this pattern
//
//  Widget
//         Widget Controller
//           UI event handlers, init code, etc goes here
//        Stateful or Stateless with widget tree
//
//     this would be widget
// class MyCounter extends StatefulWidget {
//   final Color textColor;
//   const MyCounter({Key key, this.textColor}) : super(key: key);
//   @override
//  _MyCounterController createState() => _MyCounterController();
// }
//   this would be controller WidgetController
// class _MyCounterController extends State<MyCounter> {
//   int counter = 0;
//   @override
//   Widget build(BuildContext context) => _MyCounterView(this);
//      void handleCounterPressed() => setState(() => counter += 1);
//  }
//     this is WidgetView
// class _MyCounterView extends StatelessWidget {
//    final _MyCounterController state;
//    const _MyCounterView(this.state, {Key key}) : super(key: key);
//    @override
//    Widget build(BuildContext context) {
//      return RaisedButton(
//         onPressed: state.handleCounterPressed,
//         child: Text(
//          "${state.counter}",
//         style: TextStyle(color: state.widget.textColor),
//       ),
//     );
//    }
// }

abstract class WidgetView<T1, T2> extends StatelessWidget {
  final T2 state;
  T1 get widget => (state as State).widget as T1;
  const WidgetView(this.state, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context);
}

abstract class StatelessView<T1> extends StatelessWidget {
  final T1 widget;
  const StatelessView(this.widget, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context);
}
