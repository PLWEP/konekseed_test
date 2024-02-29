import 'dart:io';

import 'package:konekseed_test/common/constant.dart';
import 'package:konekseed_test/common/utils.dart';
import 'package:konekseed_test/feature/auth/data/model/bussiness.dart';
import 'package:konekseed_test/feature/auth/domain/usecase/edit_profile.dart';
import 'package:konekseed_test/feature/auth/domain/usecase/get_current_user.dart';
import 'package:konekseed_test/feature/auth/domain/usecase/get_user_data.dart';

import 'package:konekseed_test/feature/auth/domain/usecase/log_out.dart';
import 'package:konekseed_test/feature/auth/domain/usecase/register_with_email.dart';
import 'package:konekseed_test/feature/auth/domain/usecase/sign_in_with_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final SignInWithEmail _signInWithEmail;
  final RegisterWithEmail _registerWithEmail;
  final LogOut _logOut;
  final GetCurrentUser _getCurrentUser;
  final GetBussinessData _getBussinessData;
  final EditBussinessProfile _editBussinessProfile;

  AuthNotifier({
    required LogOut logOutUseCase,
    required RegisterWithEmail registerWithEmailUseCase,
    required SignInWithEmail signInWithEmailUseCase,
    required GetCurrentUser getCurrentUserUseCase,
    required GetBussinessData getBussinessDataUseCase,
    required EditBussinessProfile editBussinessProfileUseCase,
  })  : _logOut = logOutUseCase,
        _registerWithEmail = registerWithEmailUseCase,
        _signInWithEmail = signInWithEmailUseCase,
        _getCurrentUser = getCurrentUserUseCase,
        _getBussinessData = getBussinessDataUseCase,
        _editBussinessProfile = editBussinessProfileUseCase,
        super(const AuthState.initial()) {
    getCurrentUser();
  }

  void getCurrentUser() {
    state = state.copyWith(state: EnumState.loading);
    final res = _getCurrentUser.execute();
    res.fold(
      (l) {
        state = state.copyWith(state: EnumState.failure, message: l.message);
        Constants.snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
      },
      (r) async {
        if (r == null) {
          state = const AuthState.initial();
        } else {
          final bussinessData = await _getBussinessData.execute(r.uid);

          bussinessData.fold(
            (l) {
              state =
                  state.copyWith(state: EnumState.failure, message: l.message);
              Constants.snackbarKey.currentState
                  ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
            },
            (r) => state =
                state.copyWith(state: EnumState.loaded, bussinessData: r),
          );
        }
      },
    );
  }

  void signInWithEmail(
    String email,
    String password,
  ) async {
    state = state.copyWith(state: EnumState.loading);
    final res = await _signInWithEmail.execute(email, password);
    res.fold(
      (l) {
        state = state.copyWith(state: EnumState.failure, message: l.message);
        Constants.snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
      },
      (r) => getCurrentUser(),
    );
  }

  void registerWithEmail(
    BuildContext context,
    String email,
    String password,
    String name,
    List<String> sector,
    String value,
    File logo,
  ) async {
    state = state.copyWith(state: EnumState.loading);
    final res = await _registerWithEmail.execute(
        email, password, name, sector, value, logo);

    res.fold(
      (l) {
        state = state.copyWith(state: EnumState.failure, message: l.message);
        Constants.snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
      },
      (r) {
        getCurrentUser();
        Navigator.pop(context);
      },
    );
  }

  void logout() async {
    state = state.copyWith(state: EnumState.loading);
    final res = await _logOut.execute();

    res.fold(
      (l) {
        state = state.copyWith(state: EnumState.failure, message: l.message);
        Constants.snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
      },
      (r) => getCurrentUser(),
    );
  }

  void editBussinessProfile(
    BuildContext context,
    Bussiness bussiness,
    File? logo,
  ) async {
    state = state.copyWith(state: EnumState.loading);

    final res = await _editBussinessProfile.execute(bussiness, logo);

    res.fold(
      (l) => Constants.snackbarKey.currentState
          ?.showSnackBar(showSnackBarWithoutContextRed(l.message)),
      (r) {
        getCurrentUser();
        Constants.snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextGreen('Profile Update'));
        Navigator.pop(context);
      },
    );
  }
}

class AuthState {
  final Bussiness? bussinessData;
  final EnumState state;
  final String message;

  const AuthState({
    this.bussinessData,
    this.state = EnumState.initial,
    this.message = '',
  });

  const AuthState.initial({
    this.bussinessData,
    this.state = EnumState.initial,
    this.message = '',
  });

  AuthState copyWith({
    Bussiness? bussinessData,
    EnumState? state,
    String? message,
  }) {
    return AuthState(
      bussinessData: bussinessData ?? this.bussinessData,
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }
}
