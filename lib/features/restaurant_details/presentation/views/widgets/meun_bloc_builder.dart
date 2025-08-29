import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/get_meun_cubit/get_menu_cubit.dart';
import 'menu_restaurant.dart';

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
        return const Text('Loading');
      },
    );
  }
}
