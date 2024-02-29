import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konekseed_test/common/firebase_provider.dart';
import 'package:konekseed_test/feature/auth/data/datasource/auth_remote_datasource.dart';
import 'package:konekseed_test/feature/auth/data/repository/auth_repository_impl.dart';

final authRemoteDataSourceProvider = Provider(
  (ref) => AuthRemoteDatasource(
    storage: ref.watch(storageProvider),
    auth: ref.watch(authProvider),
    firestore: ref.watch(firestoreProvider),
  ),
);

final authRepositoryProvider = Provider(
  (ref) => AuthRepositoryImpl(
    authRemoteDatasource: ref.watch(authRemoteDataSourceProvider),
  ),
);
