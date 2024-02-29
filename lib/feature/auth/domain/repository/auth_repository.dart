import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:konekseed_test/common/failure.dart';
import 'package:konekseed_test/feature/auth/data/model/bussiness.dart';

abstract class AuthRepository {
  Either<Failure, User?> getCurrentUser();
  Future<Either<Failure, Bussiness>> getBussinessData(String uid);
  Future<Either<Failure, void>> signInWithEmail(String email, String password);
  Future<Either<Failure, void>> registerWithEmail(
    String email,
    String password,
    List<String> sector,
    String value,
    File logo,
  );
  Future<Either<Failure, void>> logOut();
  Future<Either<Failure, void>> editBussinessProfile(
    Bussiness bussiness,
    File? logo,
  );
}
