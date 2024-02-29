import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:konekseed_test/common/failure.dart';
import 'package:konekseed_test/feature/auth/data/model/bussiness.dart';
import 'package:konekseed_test/feature/auth/domain/repository/auth_repository.dart';

class EditBussinessProfile {
  final AuthRepository repository;

  EditBussinessProfile(this.repository);

  Future<Either<Failure, void>> execute(Bussiness bussiness, File? logo) =>
      repository.editBussinessProfile(bussiness, logo);
}
