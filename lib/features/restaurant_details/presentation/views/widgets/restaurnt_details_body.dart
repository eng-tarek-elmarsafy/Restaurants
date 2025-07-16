import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/function/height.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/rating_view.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/restaurant_info.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/menu_tabs_bar.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/meun_bloc_builder.dart';

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
        height(16),
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
