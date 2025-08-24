import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurants/features/cart/domain/entites/car_item_entity.dart';
import 'package:restaurants/features/cart/domain/entites/cart_entity.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/meun_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);
  void addProduct(MenuItemEntity menu) {
    bool isProductExist = cartEntity.isExis(menu);
    var carItem = cartEntity.getCarItem(menu);
    if (isProductExist) {
      carItem.increasQuantity();
    } else {
      cartEntity.addCartItem(carItem);
    }
    emit(CartItemAdded());
  }

  void removeProduct(MenuItemEntity menu) {
    bool isProductExist = cartEntity.isExis(menu);
    var carItem = cartEntity.getCarItem(menu);
    if (isProductExist) {
      carItem.decreasQuantity();
    } else {
      cartEntity.removeCarItem(carItem);
    }
    emit(CartItemRemoved());
  }

  void deleteCarItem(CartItemEntity carItem) {
    cartEntity.removeCarItem(carItem);
    emit(CartItemRemoved());
  }

  void clearCart() {
    cartEntity.cartItems.clear();
    emit(CartItemRemoved());
  }
}
