import 'package:dartz/dartz.dart';
import 'package:restaurants/core/failure/failure.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<RestaurantEntity>>> getData(String path);
}
