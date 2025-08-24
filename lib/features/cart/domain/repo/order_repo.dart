import 'package:dartz/dartz.dart';
import 'package:restaurants/core/failure/failure.dart';
import 'package:restaurants/features/cart/domain/entites/ordar_entity.dart';

abstract class OrderRepo {
  Future<Either<ServerFailure, void>> addOrder({OrderEntity entity});
}
