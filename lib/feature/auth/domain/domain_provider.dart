import 'package:konekseed_test/feature/auth/data/data_provider.dart';
import 'package:konekseed_test/feature/auth/domain/usecase/edit_profile.dart';
import 'package:konekseed_test/feature/auth/domain/usecase/get_current_user.dart';
import 'package:konekseed_test/feature/auth/domain/usecase/get_user_data.dart';
import 'package:konekseed_test/feature/auth/domain/usecase/register_with_email.dart';
import 'package:konekseed_test/feature/auth/domain/usecase/sign_in_with_email.dart';
import 'package:konekseed_test/feature/auth/domain/usecase/log_out.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final logOutProvider = Provider(
  (ref) => LogOut(ref.watch(authRepositoryProvider)),
);

final registerWithEmailProvider = Provider(
  (ref) => RegisterWithEmail(ref.watch(authRepositoryProvider)),
);

final signInWithEmailProvider = Provider(
  (ref) => SignInWithEmail(ref.watch(authRepositoryProvider)),
);

final getCurrentUserProvider = Provider(
  (ref) => GetCurrentUser(ref.watch(authRepositoryProvider)),
);

final getBussinessDataProvider = Provider(
  (ref) => GetBussinessData(ref.watch(authRepositoryProvider)),
);

final editBussinessProfileProvider = Provider(
  (ref) => EditBussinessProfile(ref.watch(authRepositoryProvider)),
);
