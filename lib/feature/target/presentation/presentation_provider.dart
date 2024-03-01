import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konekseed_test/feature/target/domain/domain_provider.dart';
import 'package:konekseed_test/feature/target/presentation/notifier/target_notifier.dart';

final targetNotifierProvider =
    StateNotifierProvider<TargetNotifier, TargetState>(
  (ref) {
    return TargetNotifier(
      addTargetUseCase: ref.watch(addTargetProvider),
      editTargetUseCase: ref.watch(editTargetProvider),
      deleteTargetUseCase: ref.watch(deleteTargetProvider),
      fetchUserTargetUseCase: ref.watch(fetchUserTargetProvider),
      ref: ref,
    );
  },
);
