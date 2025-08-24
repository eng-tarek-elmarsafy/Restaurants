import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurants/features/cart/domain/entites/ordar_entity.dart';
import 'package:restaurants/features/cart/domain/repo/order_repo.dart';

part 'order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());

  final OrderRepo orderRepo;

  Future<void> addOrder({required OrderEntity entity}) async {
    emit(AddOrderLoading());
    final result = await orderRepo.addOrder(entity: entity);
    result.fold(
      (l) => emit(AddOrderFailure(message: l.message)),
      (r) => emit(AddOrderSuccess()),
    );
  }
}
