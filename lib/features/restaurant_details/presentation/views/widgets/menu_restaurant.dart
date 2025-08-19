import 'package:flutter/material.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/meun_entity.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/menu_item.dart';

class MenuRestaurant extends StatelessWidget {
  const MenuRestaurant({super.key, required this.meuns});
  final List<MenuItemEntity> meuns;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        itemCount: meuns.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 16,
          childAspectRatio: 163 / 214,
        ),
        itemBuilder: (context, index) => FoodItem(menu: meuns[index]),
      ),
    );
  }
}
