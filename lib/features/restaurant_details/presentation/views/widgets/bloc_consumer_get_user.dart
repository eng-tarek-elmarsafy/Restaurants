import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/rating_entity.dart';

class BlocConsumerGetUser extends StatelessWidget {
  const BlocConsumerGetUser({super.key, required this.listOfRating});

  final List<RatingEntity> listOfRating;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOfRating.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: kSecondaryColor,
              child: Center(
                child: Icon(
                  Icons.account_circle_rounded,
                  size: 60,
                  color: kPrimaryColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(listOfRating[index].comment, style: AppStyle.buttonTextStyle),
          ],
        );
      },
    );
  }
}
