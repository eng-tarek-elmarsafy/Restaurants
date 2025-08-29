import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entites/meun_entity.dart';

abstract class MeunRepo {
  Future<Either<Failure, List<MenuItemEntity>>> getMeunRestaurant(
    String path,
    String restaurantId,
  );
}
