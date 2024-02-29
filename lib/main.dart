import 'package:flutter/material.dart';
import 'package:konekseed_test/common/constant.dart';
import 'package:konekseed_test/feature/target/presentation/view/home_view.dart';
import 'package:konekseed_test/feature/auth/presentation/view/login_view.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Constants.snackbarKey,
      restorationScopeId: 'app',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      home: const HomeView(),
    );
  }
}
