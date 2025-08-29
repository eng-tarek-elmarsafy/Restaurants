import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper/backend_endpoint.dart';
import '../../../domain/repo/rating_repo.dart';
import 'get_rating_state.dart';

class GetRatingCubit extends Cubit<GetRatingState> {
  GetRatingCubit(this.ratingRepo) : super(GetRatingInitial());
  final RatingRepo ratingRepo;
  // Future<void> addReting(RatingEntity entity) async {
  //   emit(AddRatingLoading());

  //   final result = await ratingRepo.addRating(
  //     BackendEndpoint.ratingPath,
  //     entity,
  //   );
  //   result.fold(
  //     (failure) => emit(AddRatingFailure(err: failure.message)),
  //     (success) => emit(AddRatingSuccess(entity: null)),
  //   );
  // }

  Future<void> getRating(String restaurantId) async {
    emit(GetRatingLoading());

    final result = await ratingRepo.getRating(
      BackendEndpoint.ratingPath,
      restaurantId,
    );

    result.fold(
      (failure) => emit(GetRatingFailure(err: failure.message)),
      (success) => emit(GetRatingSuccess(entity: success)),
    );
  }
}
