import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entity/history_orders_entity.dart';
import '../../../domain/repo/history_repo.dart';

part 'get_all_orders_state.dart';

class GetAllOrdersCubit extends Cubit<GetAllOrdersState> {
  GetAllOrdersCubit(this.historyRepo) : super(GetAllOrdersInitial());
  final HistoryRepo historyRepo;

  Future<void> getAllOrders() async {
    emit(GetAllOrdersLoading());
    final result = await historyRepo.getAllOrders();
    result.fold(
      (failure) => emit(GetAllOrdersFailure(message: failure.message)),
      (orders) => emit(GetAllOrdersSuccess(orders: orders)),
    );
  }
}
