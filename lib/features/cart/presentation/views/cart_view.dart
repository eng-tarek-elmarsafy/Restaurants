import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/core/function/build_app_bar.dart';
import 'package:restaurants/features/cart/presentation/manager/cart_item_cubit/cart_item_cubit.dart';
import 'package:restaurants/features/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const id = 'cart_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(),
      child: Scaffold(
        appBar: buildAppBar(context, isGoBack: true),
        body: const CartViewBody(),
      ),
    );
  }
}

class CartViewWidget extends StatelessWidget {
  const CartViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(),
      child: const CartViewBody(),
    );
  }
}
