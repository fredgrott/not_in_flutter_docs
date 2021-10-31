import 'package:flutter/material.dart';
import 'package:gtdd_eight/src/domain/data/entities/sample_item.dart';


import '../../settings/ui/settings_view.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  static const routeName = '/';

  final List<SampleItem> items;

  static String title = 'Sample Items';

  static Key titleKey = const Key('SampleItemListView.title');

  static Key listTileTitleKey = const Key('ListTileKey');



  const SampleItemListView({
    Key? key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3),],
  }) : super(key: key);

  

  
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          key: titleKey,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName,);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        key: const Key('ListView'),
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        //need this or enclose in container to constrain size as getting render box errors
        // during goldens testing
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index,) {
          final item = items[index];

          return ListTile(
            title: Text(
              'SampleItem ${item.id}',
              
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
        },
      ),
    );
  }
}
