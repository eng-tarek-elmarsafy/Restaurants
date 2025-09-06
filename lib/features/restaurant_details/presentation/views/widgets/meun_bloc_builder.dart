import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:restaurants/core/widgets/loding_indicator.dart';
import 'package:restaurants/features/restaurant_details/presentation/manager/get_meun_cubit/get_menu_cubit.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/menu_restaurant.dart';

class MeunBlocBuilder extends StatelessWidget {
  const MeunBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMenuCubit, GetMenuState>(
      builder: (context, state) {
        if (state is GetMenuSuccess) {
          return MenuRestaurant(meuns: state.menus);
        } else if (state is GetMenuFailuer) {
          log(state.err);
          return Center(child: Text(state.err));
        }
        return ModalProgressHUD(
          inAsyncCall: state is GetMenuLoading,
          progressIndicator: const LodingIndicator(),
          child: const MenuRestaurant(meuns: []),
        );
      },
    );
  }
}
