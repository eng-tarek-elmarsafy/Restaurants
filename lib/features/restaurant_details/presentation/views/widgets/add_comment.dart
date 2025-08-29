import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constrains.dart';
import '../../../../../core/helper/get_it_setup.dart';
import '../../../../../core/style/app_style.dart';
import '../../../../home/domain/entities/restaurant_entity.dart';
import '../../../domain/repo/rating_repo.dart';
import '../../manager/add_rating_cubit/add_rating_cubit.dart';
import 'modal_bottom_sheet_body.dart';

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
