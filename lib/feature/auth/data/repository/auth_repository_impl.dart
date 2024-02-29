import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:konekseed_test/common/exception.dart';
import 'package:konekseed_test/common/failure.dart';
import 'package:konekseed_test/feature/auth/data/datasource/auth_remote_datasource.dart';
import 'package:konekseed_test/feature/auth/data/model/bussiness.dart';
import 'package:konekseed_test/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRepositoryImpl({
    required AuthRemoteDatasource authRemoteDatasource,
  }) : _authRemoteDatasource = authRemoteDatasource;

  String failureMessage(String exceptionMessage) {
    if (exceptionMessage.contains('wrong-password')) {
      return 'Wrong password';
    } else if (exceptionMessage.contains('invalid-email')) {
      return 'Invalid email';
    } else if (exceptionMessage.contains('user-disabled')) {
      return 'User has been disabled';
    } else if (exceptionMessage.contains('user-not-found')) {
      return 'User not found';
    } else if (exceptionMessage.contains('email-already-in-use')) {
      return 'Email already in use';
    } else if (exceptionMessage.contains('weak-password')) {
      return 'Try different password';
    } else if (exceptionMessage.contains('INVALID_LOGIN_CREDENTIALS')) {
      return 'Email or password is wrong';
    }

    return "Error occured, try again later.";
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      return Right(await _authRemoteDatasource.logOut());
    } on ServerException catch (e) {
      return Left(ServerFailure(failureMessage(e.toString())));
    }
  }

  @override
  Future<Either<Failure, void>> registerWithEmail(
    String email,
    String password,
    String name,
    List<String> sector,
    String value,
    File logo,
  ) async {
    try {
      return Right(await _authRemoteDatasource.registerWithEmail(
        email,
        password,
        name,
        sector,
        value,
        logo,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(failureMessage(e.toString())));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      return Right(
          await _authRemoteDatasource.signInWithEmail(email, password));
    } on ServerException catch (e) {
      return Left(ServerFailure(failureMessage(e.toString())));
    }
  }

  @override
  Either<Failure, User?> getCurrentUser() {
    try {
      return Right(_authRemoteDatasource.getCurentUser());
    } on ServerException catch (e) {
      return Left(ServerFailure(failureMessage(e.toString())));
    }
  }

  @override
  Future<Either<Failure, Bussiness>> getBussinessData(String uid) async {
    try {
      return Right(await _authRemoteDatasource.getBussinessData(uid));
    } on ServerException catch (e) {
      return Left(ServerFailure(failureMessage(e.toString())));
    }
  }

  @override
  Future<Either<Failure, void>> editBussinessProfile(
      Bussiness user, File? logo) async {
    try {
      return Right(
          await _authRemoteDatasource.editBussinessProfile(user, logo));
    } on ServerException catch (e) {
      return Left(ServerFailure(failureMessage(e.toString())));
    }
  }
}
