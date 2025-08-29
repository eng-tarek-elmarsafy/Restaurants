import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/domain/entities/restaurant_entity.dart';
import '../../../domain/entites/rating_entity.dart';
import '../../manager/get_rating_cubit/get_rating_cubit.dart';
import '../../manager/get_rating_cubit/get_rating_state.dart';
import 'rating_view_body.dart';

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
    context.read<GetRatingCubit>().getRating(widget.restaurant.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetRatingCubit, GetRatingState>(
      listener: (context, state) {
        if (state is GetRatingSuccess) {
          listOfRating = state.entity;
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
