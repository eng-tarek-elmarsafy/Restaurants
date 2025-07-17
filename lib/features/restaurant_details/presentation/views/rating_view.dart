import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/core/helper/get_it_setup.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';
import 'package:restaurants/features/restaurant_details/domain/repo/rating_repo.dart';
import 'package:restaurants/features/restaurant_details/presentation/manager/rating_cubit/rating_cubit.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/rating_view_bloc_consumer.dart';

class RatingView extends StatelessWidget {
  const RatingView({super.key, required this.restaurant});
  final RestaurantEntity restaurant;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RatingCubit(getIt.get<RatingRepo>()),
      child: RatingViewBlocConsumer(restaurant: restaurant),
    );
  }
}
