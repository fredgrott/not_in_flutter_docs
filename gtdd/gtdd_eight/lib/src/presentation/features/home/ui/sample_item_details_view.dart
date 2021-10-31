import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  static const routeName = '/sample_item';

  static String title = 'Item Details';

  static Key titleKey = const Key('SampleItemDetailsView.title');

  static String detail = 'More Information Here';

  static Key detailKey = const Key('SampleItemDetailsView.detail');



  const SampleItemDetailsView({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          key: titleKey,
        ),
      ),
      body: Center(
        child: Text(
          detail,
          key: detailKey,
        ),
      ),
    );
  }
}
