import 'package:cross_platf_labs/src/list_view/lab_item.dart';
import 'package:flutter/material.dart';

import '../settings/settings_view.dart';

/// Displays a list of SampleItems.
class LabItemListView extends StatelessWidget {
  const LabItemListView({
    super.key,
    required this.items,
  });

  static const routeName = '/';

  final List<LabItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Labs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
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
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'LabItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
              leading: Image.asset(item.image),
              title: Text('Lab ${item.id}'),
              onTap: () {
                Navigator.restorablePushNamed(context, item.routeName);
              });
        },
      ),
    );
  }
}
