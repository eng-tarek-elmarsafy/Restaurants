import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';
import 'package:restaurants/features/restaurant_details/presentation/manager/add_rating_cubit/add_rating_cubit.dart';
import 'package:restaurants/features/restaurant_details/presentation/manager/get_rating_cubit/get_rating_cubit.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/show_modal_add_comment.dart';

class ShowModalAddCommentBlocConsumer extends StatefulWidget {
  const ShowModalAddCommentBlocConsumer({super.key, required this.restaurant});

  final RestaurantEntity restaurant;

  @override
  State<ShowModalAddCommentBlocConsumer> createState() =>
      _ShowModalAddCommentBlocConsumerState();
}

class _ShowModalAddCommentBlocConsumerState
    extends State<ShowModalAddCommentBlocConsumer> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddRatingCubit, AddRatingState>(
      listener: (context, state) {
        if (state is AddRatingSuccess) {
          context.read<GetRatingCubit>().getRating(widget.restaurant.id);
          Navigator.pop(context);
        } else if (state is AddRatingLoading) {
          isLoading = true;
        } else if (state is AddRatingFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.err)));
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.width,
          child: ModalProgressHUD(
            inAsyncCall: isLoading,
            child: SingleChildScrollView(
              child: ShowModalAddComment(restaurant: widget.restaurant),
            ),
          ),
        );
      },
    );
  }
}
