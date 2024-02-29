import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konekseed_test/common/constant.dart';
import 'package:konekseed_test/feature/auth/presentation/presentation_provider.dart';
import 'package:konekseed_test/feature/target/presentation/view/home_view.dart';
import 'package:konekseed_test/feature/auth/presentation/view/login_view.dart';
import 'package:konekseed_test/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authNotifierProvider).bussinessData;
    return MaterialApp(
      scaffoldMessengerKey: Constants.snackbarKey,
      restorationScopeId: 'app',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      home: user == null ? const LoginView() : const HomeView(),
    );
  }
}
