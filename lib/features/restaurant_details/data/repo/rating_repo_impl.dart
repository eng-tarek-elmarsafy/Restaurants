import 'package:dartz/dartz.dart';
import 'package:restaurants/core/failure/failure.dart';
import 'package:restaurants/core/services/stor_services.dart';
import 'package:restaurants/features/restaurant_details/data/models/reting_model.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/reting_entity.dart';
import 'package:restaurants/features/restaurant_details/domain/repo/reting_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RatingRepoImpl extends RatingRepo {
  RatingRepoImpl({required this.services});

  final StorServices services;

  @override
  Future<Either<Failure, void>> addRating(
    String path,
    RatingEntity entity,
  ) async {
    try {
      await services.addData(path, RatingModel.fromEntity(entity).toJson());

      return right(null);
    } on PostgrestException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RatingEntity>>> getRating(String path) async {
    try {
      final respons = await services.getData(path);

      final listOfRating =
          respons
              .map<RatingEntity>((e) => RatingModel.fromJson(e).toEntity())
              .toList();
      return right(listOfRating);
    } on PostgrestException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
