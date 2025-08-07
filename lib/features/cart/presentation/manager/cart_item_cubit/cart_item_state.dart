part of 'cart_item_cubit.dart';

sealed class CartItemState {
  const CartItemState();
}

final class CartItemInitial extends CartItemState {}

final class CartItemUpdated extends CartItemState {
  const CartItemUpdated(this.cartItemEntity);
  final CartItemEntity cartItemEntity;
}
