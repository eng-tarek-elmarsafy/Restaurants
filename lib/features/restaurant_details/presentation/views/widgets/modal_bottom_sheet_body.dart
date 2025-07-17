import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/show_modal_add_commen.dart';

class ModalBottomSheetBody extends StatelessWidget {
  const ModalBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: boxDecoration(),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),

          child: SingleChildScrollView(child: ShowModalAddCommen()),
        ),
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
