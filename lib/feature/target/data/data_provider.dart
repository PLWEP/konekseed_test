import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konekseed_test/common/firebase_provider.dart';
import 'package:konekseed_test/feature/target/data/datasource/target_remote_datasource.dart';
import 'package:konekseed_test/feature/target/data/repository/target_repository_impl.dart';

final targetRemoteDataSourceProvider = Provider(
  (ref) => TargetRemoteDatasource(
    firestore: ref.watch(firestoreProvider),
  ),
);

final targetRepositoryProvider = Provider(
  (ref) => TargetRepositoryImpl(
    targetRemoteDatasource: ref.watch(targetRemoteDataSourceProvider),
  ),
);
