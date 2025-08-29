import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/cart_item_cubit/cart_item_cubit.dart';
import 'widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(),
      child: const CartViewBody(),
    );
  }
}
