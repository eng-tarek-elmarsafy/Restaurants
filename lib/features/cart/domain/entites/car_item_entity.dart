import 'package:restaurants/features/restaurant_details/domain/entites/meun_entity.dart';

class CartItemEntity {
  CartItemEntity({required this.menu, this.quanitty = 0});
  final MenuItemEntity menu;
  int quanitty;

  num calculateTotalPrice() {
    return double.parse(menu.price) * quanitty;
  }

  increasQuantity() {
    quanitty++;
  }

  decreasQuantity() {
    quanitty--;
  }
}
