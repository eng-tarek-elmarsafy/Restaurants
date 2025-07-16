import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';
import 'package:restaurants/features/restaurant_details/presentation/manager/rating_cubit/rating_cubit.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/rating_view_body.dart';

class RatingViewBlocConsumer extends StatelessWidget {
  const RatingViewBlocConsumer({super.key, required this.restaurant});
final RestaurantEntity restaurant;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RatingCubit, RatingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return  RatingViewBody(restaurant: restaurant,);
      },
    );
  }
}
