import 'package:flutter/material.dart';
import 'package:restaurants/core/function/build_app_bar.dart';
import 'package:restaurants/features/home/presentation/views/home_view.dart';
import 'package:restaurants/features/home/presentation/views/widgets/navigation_nav_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String id = 'main_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, isGoBack: false),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomeView(),
          // Placeholder(), CartView(),
          Placeholder(),
        ],
      ),
      bottomNavigationBar: NavigationNavBar(
        onTabChange: (int value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
