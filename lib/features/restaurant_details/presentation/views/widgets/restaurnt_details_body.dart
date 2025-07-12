import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/function/height.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/menu_restaurant.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/menu_tabs_bar.dart';

class RestaurntDetailsBody extends StatefulWidget {
  const RestaurntDetailsBody({super.key});

  @override
  State<RestaurntDetailsBody> createState() => _RestaurntDetailsBodyState();
}

class _RestaurntDetailsBodyState extends State<RestaurntDetailsBody> {
  int carnitIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          MenuTabsBar(
            onChang: (int index) {
              setState(() {
                carnitIndex = index;
              });
            },
          ),
          const Divider(color: kNeutralColor, height: 0),
          height(16),
          Flexible(
            child: IndexedStack(
              index: carnitIndex,
              children: const [MenuRestaurant(), Placeholder(), Placeholder()],
            ),
          ),
        ],
      ),
    );
  }
}
