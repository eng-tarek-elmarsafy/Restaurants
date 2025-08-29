import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entites/rating_entity.dart';

abstract class RatingRepo {
  Future<Either<Failure, void>> addRating(String path, RatingEntity entity);
  Future<Either<Failure, List<RatingEntity>>> getRating(String path,
      String restaurantId);
}
