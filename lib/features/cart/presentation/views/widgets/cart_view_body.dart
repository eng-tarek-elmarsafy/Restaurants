import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:restaurants/features/cart/presentation/views/widgets/cart_item_proaduct_list_view.dart';
import 'package:restaurants/features/cart/presentation/views/widgets/custom_divider.dart';
import 'package:restaurants/features/cart/presentation/views/widgets/sure_order_button.dart';
import 'package:restaurants/features/cart/presentation/views/widgets/total_price.dart';

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
                      color: kSecondaryColor,
                      width: double.infinity,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'لديك ${context.watch<CartCubit>().cartEntity.cartItems.length} منتجات في سله التسوق',
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
              SliverToBoxAdapter(
                child:
                    context.read<CartCubit>().cartEntity.cartItems.isEmpty
                        ? const SizedBox()
                        : const CustomDivider(),
              ),
              const CartItemProaductLisView(),
              SliverToBoxAdapter(
                child:
                    context.read<CartCubit>().cartEntity.cartItems.isEmpty
                        ? const SizedBox()
                        : const CustomDivider(),
              ),
            ],
          ),
          const Positioned(bottom: 50, right: 10, child: TotalPrice()),
          const Positioned(bottom: 1.5, right: 5, child: SureOrderButton()),
        ],
      ),
    );
  }
}
