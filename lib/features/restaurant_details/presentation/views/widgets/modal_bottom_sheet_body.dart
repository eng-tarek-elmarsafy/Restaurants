import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/show_modal_add_comment_bloc_consumer.dart';

class ModalBottomSheetBody extends StatelessWidget {
  const ModalBottomSheetBody({super.key, required this.restaurant});
  final RestaurantEntity restaurant;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: boxDecoration(),
        child: ShowModalAddCommentBlocConsumer(restaurant: restaurant),
      ),
    );
  }

  BoxDecoration boxDecoration() {
    return const BoxDecoration(
      color: kPrimaryColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    );
  }
}
