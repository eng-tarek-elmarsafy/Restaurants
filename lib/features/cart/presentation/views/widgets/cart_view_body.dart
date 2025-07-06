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
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                // const Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 16),
                //   child: CustomAppBar(titlel: 'السلة', backIconVisibilty: true),
                // ),
                // const SizedBox(height: 16),
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
    );
  }
}
