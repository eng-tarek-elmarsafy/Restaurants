import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper/backend_endpoint.dart';
import '../../../domain/entites/rating_entity.dart';
import '../../../domain/repo/rating_repo.dart';

part 'add_rating_state.dart';

class AddRatingCubit extends Cubit<AddRatingState> {
  AddRatingCubit(this.ratingRepo) : super(AddRatingInitial());
  final RatingRepo ratingRepo;
  Future<void> addReting(RatingEntity entity) async {
    emit(AddRatingLoading());

    final result = await ratingRepo.addRating(
      BackendEndpoint.ratingPath,
      entity,
    );
    result.fold(
      (failure) => emit(AddRatingFailure(err: failure.message)),
      (success) => emit(AddRatingSuccess()),
    );
  }
}
