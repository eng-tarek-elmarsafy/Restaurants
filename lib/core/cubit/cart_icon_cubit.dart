import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_icon_state.dart';

class CartIconCubit extends Cubit<CartIconState> {
  CartIconCubit() : super(CartIconInitial());

  void refresh() {
    emit(CartIconRefresh());
  }
}
