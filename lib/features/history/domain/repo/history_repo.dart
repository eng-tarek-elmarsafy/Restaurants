import 'package:dartz/dartz.dart';
import 'package:restaurants/core/failure/failure.dart';
import 'package:restaurants/features/history/domain/entity/history_orders_entity.dart';

abstract class HistoryRepo {
  Future<Either<ServerFailure, List<HistoryOrdersEntity>>> getAllOrders();
}
