import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../constrains.dart';
import '../../../../../core/style/app_style.dart';
import '../../../../../core/style/assets.dart';
import '../../../domain/entites/car_item_entity.dart';
import '../../manager/cart_cubit/cart_cubit.dart';
import 'cart_action_add_or_dele.dart';

class CartItemProaduct extends StatelessWidget {
  const CartItemProaduct({super.key, required this.cartItem});
  final CartItemEntity cartItem;

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
                child: Image.network(cartItem.menu.imageUrl, fit: BoxFit.fill),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          cartItem.menu.name,
                          style: AppStyle.smallTextStyle,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().deleteCarItem(cartItem);
                          },
                          child: SvgPicture.asset(Assets.imagesImagesTrash),
                        ),
                      ],
                    ),
                    Text(
                      '${cartItem.menu.price} جنيه',
                      style: AppStyle.smallTextStyle.copyWith(
                        color: kSecondaryColor,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // cartItem.increasQuantity();
                            context.read<CartCubit>().addProduct(cartItem.menu);
                          },
                          child: const CartActionAddOrDele(
                            backGroundColor: kSecondaryColor,
                            icon: Icons.add,
                            iconColor: kNeutralColor,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            cartItem.quanitty.toString(),
                            style: AppStyle.titleStyle.copyWith(
                              color: Colors.black,
                              fontSize: 19,
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            if (cartItem.quanitty > 1) {
                              // cartItem.decreasQuantity();
                              context.read<CartCubit>().removeProduct(
                                cartItem.menu,
                              );
                            }
                          },
                          child: const CartActionAddOrDele(
                            backGroundColor: kNeutralColor,
                            icon: Icons.remove,
                            iconColor: kSecondaryColor,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${cartItem.calculateTotalPrice()} جنيه ',
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
