import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entity/history_orders_entity.dart';

abstract class HistoryRepo {
  Future<Either<ServerFailure, List<HistoryOrdersEntity>>> getAllOrders();
}
