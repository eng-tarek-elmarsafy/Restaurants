import 'package:flutter/material.dart';
import '../../../../core/function/build_app_bar.dart';
import '../../../home/domain/entities/restaurant_entity.dart';
import 'widgets/restaurnt_details_body.dart';

class RestaurntDetailsView extends StatelessWidget {
  const RestaurntDetailsView({super.key, required this.restaurant});
  static const String id = 'restaurnt_details_view';
  final RestaurantEntity restaurant;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: RestaurntDetailsBody(restaurant: restaurant),
    );
  }
}
