import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/menu_tabs_bar.dart';

class RestaurntDetailsBody extends StatelessWidget {
  const RestaurntDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Flexible(child: MenuTabsBar()),
          Divider(color: kNeutralColor, height: 0),
        ],
      ),
    );
  }
}

