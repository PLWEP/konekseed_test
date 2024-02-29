import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konekseed_test/feature/auth/domain/domain_provider.dart';
import 'package:konekseed_test/feature/auth/presentation/notifier/auth_notifier.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    return AuthNotifier(
      logOutUseCase: ref.watch(logOutProvider),
      signInWithEmailUseCase: ref.watch(signInWithEmailProvider),
      registerWithEmailUseCase: ref.watch(registerWithEmailProvider),
      getCurrentUserUseCase: ref.watch(getCurrentUserProvider),
      getBussinessDataUseCase: ref.watch(getBussinessDataProvider),
      editBussinessProfileUseCase: ref.watch(editBussinessProfileProvider),
    );
  },
);
