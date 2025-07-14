import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/function/height.dart';
import 'package:restaurants/core/function/width.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';
import 'package:restaurants/features/home/presentation/views/widgets/favorite_icon.dart';
import 'package:restaurants/features/restaurant_details/presentation/manager/get_meun_cubit/get_menu_cubit.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/restaurnt_details_view.dart';

class RestsurntItem extends StatelessWidget {
  const RestsurntItem({super.key, required this.restaurant});
  final RestaurantEntity restaurant;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RestaurntDetailsView.id);
        context.read<GetMenuCubit>().getMenu(restaurant.id);
      },
      child: Row(
        children: [
          Container(
            width: 100,
            height: 70,

            decoration: BoxDecoration(
              color:
                  restaurant.imageUrl != null
                      ? Colors.transparent
                      : Colors.white,
              borderRadius: BorderRadius.circular(kBorderRadius / 2),
              border: Border.all(color: kSecondaryColor),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius / 2),
              child:
                  restaurant.imageUrl != null
                      ? Image.network(restaurant.imageUrl!, fit: BoxFit.fill)
                      : const SizedBox(),
            ),
          ),
          width(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(restaurant.name, style: AppStyle.subtitleStyle),
              height(4),
              Text(restaurant.description, style: AppStyle.smallTextStyle),
              height(4),
              RatingBarIndicator(
                rating: double.parse(restaurant.rating),
                itemBuilder:
                    (contxt, index) =>
                        const Icon(Icons.star, color: kSecondaryColor),
                itemCount: 5,
                itemSize: 15,
                direction: Axis.horizontal,
              ),
            ],
          ),
          const Spacer(),
          const FavoriteIcon(),
        ],
      ),
    );
  }
}
