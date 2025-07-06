import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/features/cart/presentation/views/widgets/cart_item_proaduct_list_view.dart';
import 'package:restaurants/features/cart/presentation/views/widgets/custom_divider.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      color: Colors.amber,
                      width: double.infinity,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'لديك 3 منتجات في سله التسوق',
                            style: AppStyle.buttonTextStyle.copyWith(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: CustomDivider()),
              const CartItemProaductLisView(),
              const SliverToBoxAdapter(child: CustomDivider()),
            ],
          ),
          Positioned(
            bottom: 1.5,
            right: 5,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kSecondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Text(
                'تأكيد الطلب',
                style: AppStyle.buttonTextStyle.copyWith(color: kPrimaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
