import 'package:flutter/widgets.dart';
import '../../../../../constrains.dart';
import 'order_bottom_sheet_body.dart';

class OrderBottomSheet extends StatelessWidget {
  const OrderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: const SingleChildScrollView(child: OrderBottomSheetBody()),
    );
  }
}