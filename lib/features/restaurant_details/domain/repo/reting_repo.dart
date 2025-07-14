import 'package:dartz/dartz.dart';
import 'package:restaurants/core/failure/failure.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/reting_entity.dart';

abstract class RatingRepo {
  Future<Either<Failure, void>> addRating(String path,RatingEntity entity);
}
