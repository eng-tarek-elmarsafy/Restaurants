import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:restaurants/core/widgets/loding_indicator.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';
import 'package:restaurants/features/restaurant_details/presentation/manager/get_rating_cubit/get_rating_cubit.dart';
import 'package:restaurants/features/restaurant_details/presentation/manager/get_rating_cubit/get_rating_state.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/rating_view_body.dart';

class RatingViewBlocBuilder extends StatefulWidget {
  const RatingViewBlocBuilder({super.key, required this.restaurant});
  final RestaurantEntity restaurant;

  @override
  State<RatingViewBlocBuilder> createState() => _RatingViewBlocBuilderState();
}

class _RatingViewBlocBuilderState extends State<RatingViewBlocBuilder> {
  @override
  void initState() {
    context.read<GetRatingCubit>().getRating(widget.restaurant.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRatingCubit, GetRatingState>(
      builder: (context, state) {
        if (state is GetRatingSuccess) {
          return RatingViewBody(
            restaurant: widget.restaurant,
            listOfRating: state.entity,
          );
        } else if (state is GetRatingFailure) {
          return Center(child: Text(state.err));
        }
        return ModalProgressHUD(
          inAsyncCall: state is GetRatingLoading,
          progressIndicator: const LodingIndicator(),
          child: RatingViewBody(
            restaurant: widget.restaurant,
            listOfRating: const [],
          ),
        );
      },
    );
  }
}
