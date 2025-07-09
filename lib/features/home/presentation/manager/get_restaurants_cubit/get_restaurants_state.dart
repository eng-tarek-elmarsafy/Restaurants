part of 'get_restaurants_cubit.dart';

@immutable
sealed class GetRestaurantsState {}

final class GetRestaurantsInitial extends GetRestaurantsState {}

final class GetRestaurantsLoading extends GetRestaurantsState {}

final class GetRestaurantsFailuer extends GetRestaurantsState {
  GetRestaurantsFailuer({required this.err});
  final String err;
}

final class GetRestaurantsSuccess extends GetRestaurantsState {
  GetRestaurantsSuccess({required this.restaurants});

  final List<RestaurantEntity> restaurants;
}
