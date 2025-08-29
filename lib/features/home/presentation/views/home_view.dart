import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/get_restaurants_cubit/get_restaurants_cubit.dart';
import 'widgets/home_view_bloc_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<GetRestaurantsCubit>(context).getRestaurants();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const HomeViewBlocBuilder();
  }
}
