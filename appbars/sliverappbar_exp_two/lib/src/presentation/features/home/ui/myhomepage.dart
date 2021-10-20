// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            stretch: true,
            stretchTriggerOffset: 150,
            flexibleSpace: FlexibleSpaceBar(
              
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              background: Image.network(
                'https://i.imgur.com/QCNbOAo.png',
                fit: BoxFit.cover,
              ),
            ),
            bottom: AppBar(
              leading: const Icon(Icons.search),
              title: const Text(
                'Dash',
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
              actions: const [
                Icon(Icons.settings),
                
              ],
            ),
          ),
          const SliverFillRemaining(),
        ],
      ),
      floatingActionButton:
          // ignore: no-empty-block
          FloatingActionButton(child: const Icon(Icons.add), onPressed: () {}),
    );
  }
}
