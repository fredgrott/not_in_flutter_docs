// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SampleItemDetailsView extends StatelessWidget {
  static const routeName = '/sample_item';

  static String title = 'Item Details';

  static Key titleKey = const Key('SampleItemDetailsView.title');

  static String detail = 'More Information Here';

  static Key detailKey = const Key('SampleItemDetailsView.detail');

  const SampleItemDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(
          title,
          key: titleKey,
          // To get the platform differences right Typography wise I need
          // to do one adjust per platform using Flutter Platform Widgets.
          style: platformThemeData(
            context,
            material: (data) => data.textTheme.headline5,
            cupertino: (data) => data.textTheme.navTitleTextStyle,
          ),
        ),
        material: (
          _,
          __,
        ) =>
            MaterialAppBarData(),
        cupertino: (
          _,
          __,
        ) =>
            CupertinoNavigationBarData(),
      ),
      body: Center(
        child: PlatformText(
          detail,
          key: detailKey,
          style: platformThemeData(
            context, 
            material: (data) => data.textTheme.bodyText1,
            cupertino: (data) => data.textTheme.textStyle,
            ),
        ),
      ),
    );
  }
}
