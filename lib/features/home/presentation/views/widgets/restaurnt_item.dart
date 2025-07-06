import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/function/height.dart';
import 'package:restaurants/core/function/width.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/features/home/presentation/views/widgets/favorite_icon.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/restaurnt_details_view.dart';

class RestsurntItem extends StatelessWidget {
  const RestsurntItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
            Navigator.pushNamed(context, RestaurntDetailsView.id);
          },
      child: Row(
        children: [
          Container(
            width: 100,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius / 2),
              border: Border.all(color: kSecondaryColor),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius / 2),
              child: Image.network(
                'https://cnn-arabic-images.cnn.io/cloudinary/image/upload/w_1920,c_scale,q_auto/cnnarabic/2019/01/02/images/118714.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          width(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('دلع كرشك', style: AppStyle.subtitleStyle),
              height(4),
              const Text('اشهي انواع اللحوم', style: AppStyle.smallTextStyle),
              height(4),
              RatingBarIndicator(
                rating: 3.3,
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
