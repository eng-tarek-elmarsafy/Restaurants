import 'package:equatable/equatable.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/meun_entity.dart';

class CartItemEntity extends Equatable {
  CartItemEntity({required this.menu, this.quanitty = 0});
  final MenuItemEntity menu;
  int quanitty;

  num calculateTotalPrice() {
    return int.parse(menu.price) * quanitty;
  }

  // num calculateTotalWeight() {
  //   return menu.unitAmount * quanitty;
  // }

  increasQuantity() {
    quanitty++;
  }

  decreasQuantity() {
    quanitty--;
  }

  @override
  List<Object?> get props => [menu];
}
