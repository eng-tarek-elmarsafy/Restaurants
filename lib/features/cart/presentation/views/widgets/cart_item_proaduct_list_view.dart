import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/cart_item_cubit/cart_item_cubit.dart';
import 'cart_item_proaduct_list_view_bloc_builder.dart';

class CartItemProaductLisView extends StatelessWidget {
  const CartItemProaductLisView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(),
      child: const CartItemProaductLisViewBlocBuilder(),
    );
  }
}

