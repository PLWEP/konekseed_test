import 'package:flutter/material.dart';
import 'package:konekseed_test/common/utils.dart';
import 'package:konekseed_test/src/view/add_target_view.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: StylishBottomBar(
          option: AnimatedBarOptions(
            iconSize: 24,
            barAnimation: BarAnimation.fade,
            iconStyle: IconStyle.simple,
            opacity: 0.3,
          ),
          items: [
            BottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
            ),
            BottomBarItem(
              icon: const Icon(Icons.notifications),
              title: const Text('Notifications'),
            ),
            BottomBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('settings'),
            ),
            BottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text('Profile'),
            ),
          ],
          fabLocation: StylishBarFabLocation.center,
          hasNotch: true,
          currentIndex: 0,
          onTap: (index) {},
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.restorablePushNamed(
            context,
            AddTargetView.routeName,
          ),
          backgroundColor: Colors.white,
          child: const Icon(Icons.add, color: Colors.red),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: viewList[0],
      ),
    );
  }
}
