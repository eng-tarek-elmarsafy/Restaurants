import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/core/cubit/cart_icon_cubit.dart';
import 'package:restaurants/core/function/build_app_bar.dart';
import 'package:restaurants/features/acconut/presentation/views/account_view.dart';
import 'package:restaurants/features/cart/presentation/views/cart_view.dart';
import 'package:restaurants/features/history/presentation/views/history_screen.dart';
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
  void initState() {
    super.initState();
    context.read<CartIconCubit>().stream.listen((event) {
      if (event is CartIconRefresh) {
        setState(() {
          _selectedIndex = 1;
        });
      }
    });
  }

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
