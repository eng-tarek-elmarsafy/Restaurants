import 'package:flutter/material.dart';
import '../../../../../constrains.dart';
import '../../../../../core/style/app_style.dart';
import '../../../domain/entites/rating_entity.dart';

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
