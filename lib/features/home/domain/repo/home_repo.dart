import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/restaurant_entity.dart';

abstract interface class HomeRepo {
  Future<Either<Failure, List<RestaurantEntity>>> getData(String path);
}
