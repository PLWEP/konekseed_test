import 'package:fpdart/fpdart.dart';
import 'package:konekseed_test/common/exception.dart';
import 'package:konekseed_test/common/failure.dart';
import 'package:konekseed_test/feature/target/data/datasource/target_remote_datasource.dart';
import 'package:konekseed_test/feature/target/data/model/target.dart';
import 'package:konekseed_test/feature/target/domain/repository/target_repository.dart';

class TargetRepositoryImpl implements TargetRepository {
  final TargetRemoteDatasource _targetRemoteDatasource;

  TargetRepositoryImpl({
    required TargetRemoteDatasource targetRemoteDatasource,
  }) : _targetRemoteDatasource = targetRemoteDatasource;

  @override
  Future<Either<Failure, void>> addTarget(Target target) async {
    try {
      return Right(await _targetRemoteDatasource.addTarget(target));
    } on ServerException {
      return const Left(ServerFailure('Terjadi kesalahan, coba lagi nanti'));
    }
  }

  @override
  Future<Either<Failure, void>> editTarget(Target target) async {
    try {
      return Right(await _targetRemoteDatasource.editTarget(target));
    } on ServerException {
      return const Left(ServerFailure('Terjadi kesalahan, coba lagi nanti'));
    }
  }

  @override
  Future<Either<Failure, List<Target>>> fetchUserTarget(String uid) async {
    try {
      return Right(await _targetRemoteDatasource.fetchUserTarget(uid));
    } on ServerException {
      return const Left(ServerFailure('Terjadi kesalahan, coba lagi nanti'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTarget(String targetId) async {
    try {
      return Right(await _targetRemoteDatasource.deleteTarget(targetId));
    } on ServerException {
      return const Left(ServerFailure('Terjadi kesalahan, coba lagi nanti'));
    }
  }
}
