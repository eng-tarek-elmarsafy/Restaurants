import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper/backend_endpoint.dart';
import '../../../domain/entities/restaurant_entity.dart';
import '../../../domain/repo/home_repo.dart';

part 'get_restaurants_state.dart';

class GetRestaurantsCubit extends Cubit<GetRestaurantsState> {
  GetRestaurantsCubit(this.homeRepo) : super(GetRestaurantsInitial());

  final HomeRepo homeRepo;

  Future<void> getRestaurants() async {
    emit(GetRestaurantsLoading());
    final result = await homeRepo.getData(BackendEndpoint.getRestaurants);
    result.fold(
      (failure) => emit(GetRestaurantsFailuer(err: failure.message)),
      (success) => emit(GetRestaurantsSuccess(restaurants: success)),
    );
  }
}
