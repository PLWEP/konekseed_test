import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konekseed_test/feature/target/data/data_provider.dart';
import 'package:konekseed_test/feature/target/domain/usecase/add_target.dart';
import 'package:konekseed_test/feature/target/domain/usecase/delete_target.dart';
import 'package:konekseed_test/feature/target/domain/usecase/edit_target.dart';
import 'package:konekseed_test/feature/target/domain/usecase/fetch_user_target.dart';

final addTargetProvider = Provider(
  (ref) => AddTarget(ref.watch(targetRepositoryProvider)),
);

final deleteTargetProvider = Provider(
  (ref) => DeleteTarget(ref.watch(targetRepositoryProvider)),
);

final editTargetProvider = Provider(
  (ref) => EditTarget(ref.watch(targetRepositoryProvider)),
);

final fetchUserTargetProvider = Provider(
  (ref) => FetchUserTarget(ref.watch(targetRepositoryProvider)),
);
