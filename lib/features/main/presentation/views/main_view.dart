import 'package:flutter/material.dart';
import '../../../../core/function/build_app_bar.dart';
import '../../../acconut/presentation/views/account_view.dart';
import '../../../cart/presentation/views/cart_view.dart';
import '../../../history/presentation/views/history_screen.dart';
import '../../../home/presentation/views/home_view.dart';
import '../../../home/presentation/views/widgets/navigation_nav_bar.dart';

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
          CartView(),
          HistoryScreen(),
          AccountView(),
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
