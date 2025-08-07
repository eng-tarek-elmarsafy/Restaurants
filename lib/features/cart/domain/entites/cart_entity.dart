import 'package:restaurants/features/cart/domain/entites/car_item_entity.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/meun_entity.dart';

class CartEntity {
  CartEntity(this.cartItems);
  final List<CartItemEntity> cartItems;

  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  removeCarItem(CartItemEntity carItem) {
    cartItems.remove(carItem);
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var carItem in cartItems) {
      totalPrice += carItem.calculateTotalPrice();
    }
    return totalPrice;
  }

  bool isExis(MenuItemEntity product) {
    for (var carItem in cartItems) {
      if (carItem.menu == product) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCarItem(MenuItemEntity product) {
    for (var carItem in cartItems) {
      if (carItem.menu == product) {
        return carItem;
      }
    }
    return CartItemEntity(menu: product, quanitty: 1);
  }
}
