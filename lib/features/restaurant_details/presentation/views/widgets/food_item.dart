import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/function/height.dart';
import 'package:restaurants/core/style/app_style.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        
        borderRadius: BorderRadius.all(Radius.circular(kBorderRadius / 2)),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              // const SizedBox(height: 17),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(kBorderRadius / 2),
                    topRight: Radius.circular(kBorderRadius / 2),
                  ),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ5zIPxj3-qnowxrEAVECr6YsxVdiXDVW_-w&s',
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text('فراخ مشويه', style: AppStyle.subtitleStyle),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${30}جنية',
                                style: AppStyle.smallTextStyle,
                              ),
                              TextSpan(
                                text: ' / ',
                                style: AppStyle.smallTextStyle,
                              ),
                              TextSpan(
                                text: 'الكيلو',
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
              height(4),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border_outlined,
                color: kNeutralColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
