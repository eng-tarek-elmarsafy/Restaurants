import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/function/height.dart';
import 'package:restaurants/features/restaurant_details/presentation/manager/get_meun_cubit/get_menu_cubit.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/menu_restaurant.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/menu_tabs_bar.dart';

class RestaurntDetailsBody extends StatefulWidget {
  const RestaurntDetailsBody({super.key});

  @override
  State<RestaurntDetailsBody> createState() => _RestaurntDetailsBodyState();
}

class _RestaurntDetailsBodyState extends State<RestaurntDetailsBody> {
  int carnitIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          MenuTabsBar(
            onChang: (int index) {
              setState(() {
                carnitIndex = index;
              });
            },
          ),
          const Divider(color: kNeutralColor, height: 0),
          height(16),
          Flexible(
            child: IndexedStack(
              index: carnitIndex,
              children: const [MeunBlocBuilder(), Placeholder(), Placeholder()],
            ),
          ),
        ],
      ),
    );
  }
}

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
