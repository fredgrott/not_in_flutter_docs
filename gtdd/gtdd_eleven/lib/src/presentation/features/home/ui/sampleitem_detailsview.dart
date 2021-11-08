// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';


import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:gtdd_eleven/src/presentation/features/home/ui/sampleitem_listview.dart';
import 'package:gtdd_eleven/src/presentation/themes/my_cupertinocolors.dart';
import 'package:gtdd_eleven/src/presentation/themes/my_special_cupertino_textstyles.dart';

class SampleItemDetailsView extends StatelessWidget {
  static const routeName = '/sample_item';

  static String title = 'Item Details';

  static Key titleKey = const Key('SampleItemDetailsView.title');

  static String detail = 'More Information Here';

  

  

  const SampleItemDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    //
    return PlatformScaffold(
      //
      //
      appBar: PlatformAppBar(
        widgetKey: const Key("ItemDetailsAppBar"),
        //
        //
        leading: PlatformIconButton(
          onPressed: () {
            Navigator.restorablePushNamed(
              context,
              platformPageRoute<dynamic>(
                settings: SampleItemListView.routeName as RouteSettings,
                context: context,
              ) as String,
            );
          },
          //
          //
          icon: Icon(PlatformIcons(context).back),
          
          padding: const EdgeInsets.all(1),
          material: (_, __,)  => MaterialIconButtonData(

            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          cupertino: (_, __,) => CupertinoIconButtonData(
            pressedOpacity: 0.10,
          ),
        ),
        //
        //
        title: PlatformText(
          title,
          key: titleKey,
          // To get the platform differences right Typography wise I need
          // to do one adjust per platform using Flutter Platform Widgets.
          
        ),
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
              widgetKey: titleKey,
              title: PlatformText(title, style: myCupertinoNavigationBarTextStyle,),
              backgroundColor: myCupertinoNavigationBarLightBackgroundColor,
              previousPageTitle: "Sample Items",
              brightness: Brightness.light,
            ),
      ),
      body: Center(
        child: PlatformText(
          detail,
          key: const Key("SampleItemDetailsView.detail"),
          
        ),
      ),
    );
  }
}
