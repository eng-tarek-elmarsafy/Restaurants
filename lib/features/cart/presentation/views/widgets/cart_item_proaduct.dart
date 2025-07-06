import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/core/style/assets.dart';
import 'package:restaurants/features/cart/presentation/views/widgets/cart_action_add_or_dele.dart';

class CartItemProaduct extends StatelessWidget {
  const CartItemProaduct({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            SizedBox(
              width: 90,
              height: 95,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpEpu_AdjtZfYuRMby9oqhPElQglmsVl22Gg&s',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  // left: isArabic() ? 0 : 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('بطيخ', style: AppStyle.smallTextStyle),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(Assets.imagesImagesTrash),
                        ),
                      ],
                    ),
                    Text(
                      '3 كم',
                      style: AppStyle.smallTextStyle.copyWith(
                        color: kSecondaryColor,
                      ),
                    ),
                    Row(
                      children: [
                        const CartActionAddOrDele(
                          backGroundColor: kSecondaryColor,
                          icon: Icons.add,
                          iconColor: kNeutralColor,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            '3',
                            style: AppStyle.titleStyle.copyWith(
                              color: Colors.black,
                              fontSize: 19,
                            ),
                          ),
                        ),

                        const CartActionAddOrDele(
                          backGroundColor: kNeutralColor,
                          icon: Icons.remove,
                          iconColor: kSecondaryColor,
                        ),
                        const Spacer(),
                        Text(
                          '60 جنيه ',
                          style: AppStyle.subtitleStyle.copyWith(
                            color: kSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
