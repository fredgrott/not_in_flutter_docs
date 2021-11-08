// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';


// Gist: ask which axis is unbounded for the widget and that is the widget than to 
//       use as wrapper for testing.

ListTile myCustomWidget = const ListTile(
          title: Text('Sample 1'),
          key: ValueKey<int>(1),
          leading: CircleAvatar(
            // Display the Flutter Logo image asset.
            foregroundImage: AssetImage('assets/images/flutter_logo.png'),
          ),
        );
