import 'package:flutter/material.dart';
import '../../../home/domain/entities/restaurant_entity.dart';
import 'widgets/text_info_restaurant.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({super.key, required this.restaurant});
  final RestaurantEntity restaurant;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,

          // title: Text(restaurant.name, style: AppStyle.buttonTextStyle),
          flexibleSpace: Image.network(restaurant.imageUrl!, fit: BoxFit.fill),
          toolbarHeight: MediaQuery.sizeOf(context).height * .45,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextInfoRestaurant(restaurant: restaurant),
          ),
        ),
        // SliverToBoxAdapter(
        //   child: Align(
        //     child: Row(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         const Text('اتصل بنا', style: AppStyle.subtitleStyle),
        //         const SizedBox(width: 10),
        //         Text(restaurant.phone, style: AppStyle.buttonTextStyle),
        //         IconButton(
        //           onPressed: () {
        //             launchUrl(Uri(scheme: 'tel', path: restaurant.phone));
        //           },
        //           icon: const Icon(Icons.call, color: kNeutralColor, size: 25),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
