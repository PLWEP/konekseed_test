import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'target_details_view.dart';

class TargetListView extends StatelessWidget {
  const TargetListView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
        leading: Container(
          margin: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: AssetImage('assets/images/flutter_logo.png'),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              title: Text('SampleItem ${item.id}'),
              leading: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                Navigator.restorablePushNamed(
                  context,
                  TargetDetailsView.routeName,
                );
              });
        },
      ),
    );
  }
}
