import 'package:fpdart/fpdart.dart';
import 'package:konekseed_test/common/failure.dart';
import 'package:konekseed_test/feature/auth/data/model/bussiness.dart';
import 'package:konekseed_test/feature/auth/domain/repository/auth_repository.dart';

class GetBussinessData {
  final AuthRepository repository;

  GetBussinessData(this.repository);

  Future<Either<Failure, Bussiness>> execute(String uid) =>
      repository.getBussinessData(uid);
}
