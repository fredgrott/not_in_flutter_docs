// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage>{

  static const double listItemHeight = 50;
  static const int listItemCount = 15;

  static const double sessionHeight =
      kToolbarHeight + (listItemCount * listItemHeight);

  late int floatingAppBarIndex;
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    floatingAppBarIndex = 0;
    controller = ScrollController()..addListener(onScroll);
  }

  void onScroll() {
    double scrollOffset = controller.offset;
    int sessionsScrolled = 0;

    while (scrollOffset > sessionHeight) {
      scrollOffset -= sessionHeight;
      sessionsScrolled++;
    }

    if (sessionsScrolled != floatingAppBarIndex) {
      setState(() {
        floatingAppBarIndex = sessionsScrolled;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: CustomScrollView(
        controller: controller,
        slivers: <Widget>[
          SliverAppBar(
            floating: floatingAppBarIndex == 0,
            automaticallyImplyLeading: false,
            title: const Text('1'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const SizedBox(
                  height: listItemHeight,
                  child: ListTile(
                    title: Text('Text 1'),
                  ),
                );
              },
              childCount: listItemCount,
            ),
          ),
          SliverAppBar(
            floating: floatingAppBarIndex == 1,
            automaticallyImplyLeading: false,
            title: const Text('2'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const SizedBox(
                  height: listItemHeight,
                  child: ListTile(
                    title: Text('Text 2'),
                  ),
                );
              },
              childCount: listItemCount,
            ),
          ),
        ],
      ),
    );
  }

}
