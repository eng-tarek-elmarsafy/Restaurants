import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/modal_bottom_sheet_body.dart';

class AddComment extends StatelessWidget {
  const AddComment({super.key, required this.restaurant});
  final RestaurantEntity restaurant;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder:
                (context) =>  ModalBottomSheetBody(restaurant: restaurant),
          );
        },
        icon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('اضافة تقييم', style: AppStyle.buttonTextStyle),
        ),
      ),
    );
  }
}
