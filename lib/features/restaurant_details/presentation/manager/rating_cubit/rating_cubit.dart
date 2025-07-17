import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/core/helper/backend_endpoint.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/rating_entity.dart';
import 'package:restaurants/features/restaurant_details/domain/repo/reting_repo.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit(this.ratingRepo) : super(RatingInitial());
  final RatingRepo ratingRepo;
  Future<void> addReting(RatingEntity entity) async {
    emit(RatingLoading());

    final result = await ratingRepo.addRating(
      BackendEndpoint.ratingPath,
      entity,
    );
    result.fold(
      (failure) => emit(RatingFailure(err: failure.message)),
      (success) => emit(RatingSuccess(entity: null)),
    );
  }

  Future<void> getRating() async {
    emit(RatingLoading());

    final result = await ratingRepo.getRating(BackendEndpoint.ratingPath);

    result.fold(
      (failure) => emit(RatingFailure(err: failure.message)),
      (success) => emit(RatingSuccess(entity: success)),
    );
  }
}
