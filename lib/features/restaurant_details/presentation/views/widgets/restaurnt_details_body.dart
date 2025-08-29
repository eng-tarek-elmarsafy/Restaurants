import 'package:flutter/material.dart';
import '../../../../../constrains.dart';
import '../../../../home/domain/entities/restaurant_entity.dart';
import '../rating_view.dart';
import '../restaurant_info.dart';
import 'menu_tabs_bar.dart';
import 'meun_bloc_builder.dart';

class RestaurntDetailsBody extends StatefulWidget {
  const RestaurntDetailsBody({super.key, required this.restaurant});
  final RestaurantEntity restaurant;
  @override
  State<RestaurntDetailsBody> createState() => _RestaurntDetailsBodyState();
}

class _RestaurntDetailsBodyState extends State<RestaurntDetailsBody> {
  int carnitIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuTabsBar(
          onChang: (int index) {
            setState(() {
              carnitIndex = index;
            });
          },
        ),
        const Divider(color: kNeutralColor, height: 0),
        const SizedBox(height: 16),
        Flexible(
          child: IndexedStack(
            index: carnitIndex,
            children: [
              const MeunBlocBuilder(),
              RatingView(restaurant: widget.restaurant),
              RestaurantInfo(restaurant: widget.restaurant),
            ],
          ),
        ),
      ],
    );
  }
}
