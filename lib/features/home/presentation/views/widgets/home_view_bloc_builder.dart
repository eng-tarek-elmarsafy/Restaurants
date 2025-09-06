import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:restaurants/core/widgets/loding_indicator.dart';
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
          log(state.err);
          return Center(child: Text(state.err));
        } else {
          return ModalProgressHUD(
            inAsyncCall: state is GetRestaurantsLoading,
            progressIndicator: const LodingIndicator(),
            child: const HomeViewBody(restaurants: []),
          );
        }
      },
    );
  }
}
