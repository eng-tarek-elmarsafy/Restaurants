import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/core/helper/restaurant_entity_demo.dart';
import 'package:restaurants/features/home/presentation/manager/get_restaurants_cubit/get_restaurants_cubit.dart';
import 'package:restaurants/features/home/presentation/views/widgets/home_view_body.dart';

class HomeViewBlocBuilder extends StatelessWidget {
  const HomeViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRestaurantsCubit, GetRestaurantsState>(
      builder: (context, state) {
        if (state is GetRestaurantsSuccess) {
          return HomeViewBody(restaurants: state.restaurants);
        } else if (state is GetRestaurantsFailuer) {
          return Center(child: Text(state.err));
        } else {
          return HomeViewBody(restaurants: restaurantEntityDemo);
        }
      },
    );
  }
}
