import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/services/shared_preferences.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/core/widgets/custom_button.dart';
import 'package:restaurants/core/widgets/custom_rating.dart';
import 'package:restaurants/core/widgets/custom_text_form_field.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/rating_entity.dart';
import 'package:restaurants/features/restaurant_details/presentation/manager/rating_cubit/rating_cubit.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/show_modal_top.dart';

class ShowModalAddComment extends StatefulWidget {
  const ShowModalAddComment({super.key, required this.restaurant});
  final RestaurantEntity restaurant;

  @override
  State<ShowModalAddComment> createState() => _ShowModalAddCommentState();
}

class _ShowModalAddCommentState extends State<ShowModalAddComment> {
  double retingValue = 0;
  late String comment;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 5),
        const ShowModalTop(),
        const SizedBox(height: 20),
        Text(widget.restaurant.name, style: AppStyle.titleStyle),
        const SizedBox(height: 40),
        CustomRating(
          onRatingUpdate: (double rating) {
            retingValue = rating;
          },
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          maxLines: 5,
          hintText: 'اكتب تعليقك',
          onSaved: (value) {
            comment = value!;
          },
        ),
        const SizedBox(height: 20),
        CustomButton(
          title: 'اضافة',
          onPressed: () {
            context.read<RatingCubit>().addReting(
              RatingEntity(
                name: Prefs.getString(kUserName),
                restaurantId: widget.restaurant.id,
                reting: retingValue,
                comment: comment,
                userId: Prefs.getString(kUserId),
              ),
            );
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
