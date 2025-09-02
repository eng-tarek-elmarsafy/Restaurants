part of 'cart_icon_cubit.dart';

sealed class CartIconState extends Equatable {
  const CartIconState();

  @override
  List<Object> get props => [];
}

final class CartIconInitial extends CartIconState {}

final class CartIconRefresh extends CartIconState {}
