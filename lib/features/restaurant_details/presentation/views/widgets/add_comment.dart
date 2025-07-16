import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/widgets/custom_text_form_field.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/reting_entity.dart';
import 'package:restaurants/features/restaurant_details/presentation/manager/rating_cubit/rating_cubit.dart';

class AddComment extends StatefulWidget {
  const AddComment({super.key, required this.restaurant});
  final RestaurantEntity restaurant;
  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  bool isActve = false;
  bool done = false;
  late String comment;
  late GlobalKey<FormState> formKey;
  late AutovalidateMode autovalidateMode;

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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        decoration: BoxDecoration(
          color: isActve ? kNeutralColor : kSecondaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: IconButton(
          onPressed: () {
            setState(() {
              isActve = !isActve;
            });
          },
          icon:
              isActve
                  ? CustomTextFormField(
                    hintText: 'إضافة تعليق',
                    onSaved: (value) {
                      comment = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'hgghhgh';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          await context.read<RatingCubit>().addReting(
                            RatingEntity(
                              restaurantId: widget.restaurant.id,
                              userId: widget.restaurant.id,
                              reting: 4.0,
                              comment: comment,
                            ),
                          );
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                        }
                      },
                      icon: const Icon(Icons.send_rounded),
                    ),
                  )
                  : const Icon(Icons.add, color: kPrimaryColor, size: 30),
        ),
      ),
    );
  }
}
