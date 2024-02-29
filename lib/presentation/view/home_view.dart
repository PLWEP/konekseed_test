import 'package:flutter/material.dart';
import 'package:konekseed_test/common/utils.dart';
import 'package:konekseed_test/presentation/view/add_target_view.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _pageIndex = 0;

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
          currentIndex: _pageIndex,
          onTap: (index) => setState(
            () => _pageIndex = index,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const AddTargetView())),
          backgroundColor: Colors.white,
          child: const Icon(Icons.add, color: Colors.red),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: viewList[_pageIndex],
      ),
    );
  }
}
