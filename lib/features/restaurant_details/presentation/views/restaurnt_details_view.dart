import 'package:flutter/material.dart';
import 'package:restaurants/core/function/build_app_bar.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/restaurnt_details_body.dart';

class RestaurntDetailsView extends StatelessWidget {
  const RestaurntDetailsView({super.key});
  static const String id = 'restaurnt_details_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const RestaurntDetailsBody(),
    );
  }
}
