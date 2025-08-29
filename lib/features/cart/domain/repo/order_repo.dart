import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entites/ordar_entity.dart';

abstract class OrderRepo {
  Future<Either<ServerFailure, void>> addOrder({OrderEntity entity});
}
