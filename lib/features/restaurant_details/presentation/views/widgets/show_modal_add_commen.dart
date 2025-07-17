import 'package:flutter/material.dart';
import 'package:restaurants/core/widgets/custom_rating.dart';
import 'package:restaurants/core/widgets/custom_text_form_field.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/show_modal_top.dart';

class ShowModalAddCommen extends StatelessWidget {
  const ShowModalAddCommen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 5),
        const ShowModalTop(),
        const SizedBox(height: 40),
        CustomRating(
          onRatingUpdate: (double rating) {
            // log(rating.toString());
          },
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          maxLines: 5,
          hintText: 'اكتب تقييمك',
          onSaved: (value) {
            // comment = value!;
          },
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
