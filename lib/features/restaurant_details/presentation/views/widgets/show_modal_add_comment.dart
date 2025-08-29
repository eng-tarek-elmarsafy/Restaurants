import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constrains.dart';
import '../../../../../core/services/shared_preferences.dart';
import '../../../../../core/style/app_style.dart';
import '../../../../../core/widgets/close_show_modal_bottom.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_rating.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../home/domain/entities/restaurant_entity.dart';
import '../../../domain/entites/rating_entity.dart';
import '../../manager/add_rating_cubit/add_rating_cubit.dart';

class ShowModalAddComment extends StatefulWidget {
  const ShowModalAddComment({super.key, required this.restaurant});
  final RestaurantEntity restaurant;

  @override
  State<ShowModalAddComment> createState() => _ShowModalAddCommentState();
}

class _ShowModalAddCommentState extends State<ShowModalAddComment> {
  late GlobalKey<FormState> formKey;
  late AutovalidateMode autovalidateMode;

  double retingValue = 3.0;
  late String comment;

  @override
  void initState() {
    formKey = GlobalKey();
    autovalidateMode = AutovalidateMode.disabled;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            const CloseShowModalBottom(),
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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'اكتب تعليق';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              title: 'اضافة',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<AddRatingCubit>().addReting(
                    RatingEntity(
                      name: Prefs.getString(kUserName),
                      restaurantId: widget.restaurant.id,
                      reting: retingValue,
                      comment: comment,

                      // imageUrl: Prefs.getString(kImageProfile),
                      userId: Prefs.getString(kUserId),
                    ),
                  );
                  autovalidateMode = AutovalidateMode.disabled;
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }

                // Navigator.pop(context);
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
