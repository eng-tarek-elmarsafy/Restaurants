import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/meun_entity.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({super.key, required this.menu});
  final MenuItemEntity menu;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // color: Colors.greenAccent,
        borderRadius: BorderRadius.all(Radius.circular(kBorderRadius / 2)),
      ),
      child: Column(
        children: [
          // const SizedBox(height: 17),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kBorderRadius / 2),
                topRight: Radius.circular(kBorderRadius / 2),
              ),
              child: Image.network(menu.imageUrl, fit: BoxFit.fill),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    menu.name,
                    style: AppStyle.subtitleStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'السعر',
                            style: AppStyle.smallTextStyle,
                          ),
                          const TextSpan(
                            text: '  ',
                            style: AppStyle.smallTextStyle,
                          ),
                          TextSpan(
                            text: '${menu.price}جنية',
                            style: AppStyle.smallTextStyle,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Icons.add,
                            color: Color(0xffffffff),
                            // size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
