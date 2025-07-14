import 'package:dartz/dartz.dart';
import 'package:restaurants/core/failure/failure.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/meun_entity.dart';

abstract class MeunRepo {
  Future<Either<Failure, List<MenuItemEntity>>> getMeunRestaurant(
    String path,
    String restaurantId,
  );
}
