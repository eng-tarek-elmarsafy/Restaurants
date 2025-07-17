import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/rating_entity.dart';
import 'package:restaurants/features/restaurant_details/presentation/manager/rating_cubit/rating_cubit.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/rating_view_body.dart';

class RatingViewBlocConsumer extends StatefulWidget {
  const RatingViewBlocConsumer({super.key, required this.restaurant});
  final RestaurantEntity restaurant;

  @override
  State<RatingViewBlocConsumer> createState() => _RatingViewBlocConsumerState();
}

class _RatingViewBlocConsumerState extends State<RatingViewBlocConsumer> {
  List<RatingEntity> listOfRating = [];

  @override
  void initState() {
    context.read<RatingCubit>().getRating();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RatingCubit, RatingState>(
      listener: (context, state) {
        if (state is RatingSuccess) {
          listOfRating = state.entity != null ? state.entity! : listOfRating;
        }
      },
      builder: (context, state) {
        return RatingViewBody(
          restaurant: widget.restaurant,
          listOfRating: listOfRating,
        );
      },
    );
  }
}
