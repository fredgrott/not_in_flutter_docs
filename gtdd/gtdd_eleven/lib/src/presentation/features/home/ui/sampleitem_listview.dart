// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:gtdd_eleven/src/domain/data/entities/sample_item.dart';

import 'package:gtdd_eleven/src/presentation/features/home/ui/sampleitem_detailsview.dart';
import 'package:gtdd_eleven/src/presentation/features/settings/ui/settingsview.dart';


class SampleItemListView extends StatelessWidget {
  static const routeName = '/';

  final List<SampleItem> items;

  static String title = 'Sample Items';

  static Key titleKey = const Key('SampleItemListView.title');

  static Key listTileTitleKey = const Key('ListTileKey');

  const SampleItemListView({
    Key? key,
    this.items = const [
      SampleItem(1),
      SampleItem(2),
      SampleItem(3),
    ],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    //
    return PlatformScaffold(
      //
      //
      appBar: PlatformAppBar(
        widgetKey: const Key("SampleItemsAppBar"),
        //
        //
        title: PlatformText(
          title,
          key: titleKey,
          // To get the platform differences right Typography wise I need
          // to do one adjust per platform using Flutter Platform Widgets.
          
        ),
        trailingActions: <Widget>[
          //
          //
          PlatformIconButton(
            //I whenever possible adapt to target platform specifics.
            //
            icon: Icon(PlatformIcons(context).settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(
                context,
                SettingsView.routeName,
              );
            },
          ),
        ],
        material: (
          _,
          __,
        ) =>
            MaterialAppBarData(
              
              centerTitle: true,
            ),
        cupertino: (
          _,
          __,
        ) =>
            CupertinoNavigationBarData(
              title: PlatformText(
            title,
            
            key: titleKey,
          ),
              
              brightness: Brightness.light,
            ),
      ),
      body: ListView.builder(
          key: const Key('ListView'),
          restorationId: 'sampleItemListView',
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index,) {
            final item = items[index];

            return ListTile(
              //
              //
              title: PlatformText(
                "SampleItem ${item.id}",
                key: ValueKey<int>(item.id),
                
              
               ),
               leading: const CircleAvatar(
                 // Display the Flutter Logo image asset.
                 foregroundImage: AssetImage('assets/images/flutter_logo.png'),
               ),

               onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(
                  context,
                  SampleItemDetailsView.routeName,
                );
            },
            );
          },),
    );
  }
}
