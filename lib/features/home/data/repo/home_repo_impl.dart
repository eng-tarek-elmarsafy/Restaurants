import 'package:dartz/dartz.dart';
import 'package:restaurants/core/failure/failure.dart';
import 'package:restaurants/core/services/stor_services.dart';
import 'package:restaurants/features/home/data/models/restaurant_model.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';
import 'package:restaurants/features/home/domain/repo/home_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl({required this.services});

  final StorServices services;
  @override
  Future<Either<Failure, List<RestaurantEntity>>> getData(String path) async {
    try {
      var respons = await services.getData(path);

      List<RestaurantEntity> restaurants =
          respons
              .map((e) => RestaurantModel.toEntity(RestaurantModel.fromJson(e)))
              .toList();

      return right(restaurants);
    } on PostgrestException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
