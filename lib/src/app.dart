import 'package:flutter/material.dart';

import 'view/add_target_view.dart';
import 'view/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case AddTargetView.routeName:
                return const AddTargetView();
              case HomeView.routeName:
              default:
                return const HomeView();
            }
          },
        );
      },
    );
  }
}
