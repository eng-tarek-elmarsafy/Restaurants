import 'package:flutter/material.dart';
import 'package:restaurants/core/function/build_app_bar.dart';
import 'package:restaurants/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:restaurants/features/home/presentation/views/widgets/navigation_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String id = 'home_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeViewBody(),
      appBar: buildAppBar(isGoBack: false, context),
      bottomNavigationBar: const NavigationNavBar(),
    );
  }
}
