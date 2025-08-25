part of 'get_all_orders_cubit.dart';

sealed class GetAllOrdersState extends Equatable {
  const GetAllOrdersState();

  @override
  List<Object> get props => [];
}

final class GetAllOrdersInitial extends GetAllOrdersState {}

final class GetAllOrdersLoading extends GetAllOrdersState {}

final class GetAllOrdersSuccess extends GetAllOrdersState {
  const GetAllOrdersSuccess({required this.orders});
  final List<HistoryOrdersEntity> orders;
}

final class GetAllOrdersFailure extends GetAllOrdersState {
  const GetAllOrdersFailure({required this.message});
  final String message;
}
