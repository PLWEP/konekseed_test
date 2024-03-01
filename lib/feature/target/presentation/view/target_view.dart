import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:konekseed_test/common/constant.dart';
import 'package:konekseed_test/feature/target/presentation/presentation_provider.dart';
import 'package:konekseed_test/feature/target/presentation/view/edit_target_view.dart';

class TargetView extends ConsumerStatefulWidget {
  const TargetView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TargetViewState();
}

class _TargetViewState extends ConsumerState<TargetView> {
  int _tabValue = 0;
  List category = ['Quantitative', 'Qualitative'];

  void deleteTarget(String targetId) =>
      ref.read(targetNotifierProvider.notifier).deleteTarget(targetId);

  @override
  Widget build(BuildContext context) {
    final targetState = ref.watch(targetNotifierProvider);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomSlidingSegmentedControl(
            initialValue: _tabValue,
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
            onValueChanged: (v) => setState(() => _tabValue = v),
          ),
          const SizedBox(height: 12),
          targetState.state == EnumState.loading
              ? const Loader()
              : targetState.state == EnumState.failure
                  ? ErrorText(error: targetState.message)
                  : targetState.targetList
                          .where((element) =>
                              element.category == category[_tabValue])
                          .toList()
                          .isEmpty
                      ? const EmptyText()
                      : Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            restorationId: 'sampleItemListView',
                            itemCount: targetState.targetList.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item = targetState.targetList
                                  .where((element) =>
                                      element.category == category[_tabValue])
                                  .toList()[index];

                              return Dismissible(
                                key: Key(item.id.toString()),
                                onDismissed: (direction) =>
                                    deleteTarget(item.id),
                                background: Container(
                                  color: Colors.red,
                                  child: const Icon(Icons.delete),
                                ),
                                child: ListTile(
                                  title: Text(item.name),
                                  leading: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300,
                                            offset: const Offset(0, 5))
                                      ],
                                      color: item.status == 'done'
                                          ? Colors.green
                                          : item.status == 'in progress'
                                              ? Colors.yellow
                                              : item.status == 'to do'
                                                  ? Colors.blue
                                                  : Colors.white,
                                    ),
                                    child: Icon(
                                      item.status == 'done'
                                          ? Icons.check
                                          : item.status == 'in progress'
                                              ? Icons.alarm_on
                                              : item.status == 'to do'
                                                  ? Icons.note
                                                  : Icons.error,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => EditTargetView(
                                          target: item,
                                        ),
                                      ),
                                    ),
                                    icon: const Icon(Icons.edit),
                                  ),
                                  isThreeLine: true,
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          '${DateFormat.yMEd().format(item.startDate)} - ${DateFormat.yMEd().format(item.endDate)}'),
                                      Text(item.weight.toString()),
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
