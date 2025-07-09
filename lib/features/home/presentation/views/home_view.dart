import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/core/helper/get_it_setup.dart';
import 'package:restaurants/features/home/domain/repo/home_repo.dart';
import 'package:restaurants/features/home/presentation/manager/get_restaurants_cubit/get_restaurants_cubit.dart';
import 'package:restaurants/features/home/presentation/views/widgets/home_view_bloc_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetRestaurantsCubit(getIt.get<HomeRepo>()),
      child: const HomeViewBlocBuilder(),
    );
  }
}
