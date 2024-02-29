import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:konekseed_test/presentation/view/sample_item.dart';

class TargetView extends StatelessWidget {
  const TargetView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomSlidingSegmentedControl(
            initialValue: 0,
            children: const {
              0: Text('Quantitative'),
              1: Text('Qualitative'),
            },
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            thumbDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0.0, 2.0),
                ),
              ],
            ),
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInToLinear,
            onValueChanged: (v) {
              print(v);
            },
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              restorationId: 'sampleItemListView',
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];

                return Dismissible(
                  key: Key(item.id.toString()),
                  onDismissed: (direction) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${item.id} dismissed')));
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Icon(Icons.delete),
                  ),
                  child: ListTile(
                    title: Text('Target ${item.id}'),
                    leading: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(0, 5))
                        ],
                        color: Colors.green,
                      ),
                      child: const Icon(Icons.check),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                    isThreeLine: true,
                    subtitle: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date: Start Date - End Date'),
                        Text('Weight : 1'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
