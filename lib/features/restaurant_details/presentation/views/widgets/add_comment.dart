import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/helper/get_it_setup.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';
import 'package:restaurants/features/restaurant_details/domain/repo/rating_repo.dart';
import 'package:restaurants/features/restaurant_details/presentation/manager/add_rating_cubit/add_rating_cubit.dart';
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
                (context) => BlocProvider(
                  create: (context) => AddRatingCubit(getIt.get<RatingRepo>()),
                  child: ModalBottomSheetBody(restaurant: restaurant),
                ),
          );
        },
        icon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'اضافة تقييم',
            style: AppStyle.buttonTextStyle.copyWith(color: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
