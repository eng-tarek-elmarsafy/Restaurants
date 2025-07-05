import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/core/helper/get_it_setup.dart';
import 'package:restaurants/features/auth/domain/repo/auth_repo.dart';
import 'package:restaurants/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:restaurants/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:restaurants/features/auth/presentation/views/sign_in_view.dart';
import 'package:restaurants/features/auth/presentation/views/sign_up_view.dart';
import 'package:restaurants/features/main/presentation/views/main_view.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/restaurnt_details_view.dart';
import 'package:restaurants/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case SplashView.id:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case SignUpView.id:
      return MaterialPageRoute(
        builder:
            (context) => BlocProvider(
              create: (context) => SignUpCubit(getIt.get<AuthRepo>()),
              child: const SignUpView(),
            ),
      );
    case MainView.id:
      return MaterialPageRoute(builder: (context) => const MainView());
    case SignInView.id:
      return MaterialPageRoute(
        builder:
            (context) => BlocProvider(
              create: (context) => SignInCubit(getIt.get<AuthRepo>()),
              child: const SignInView(),
            ),
      );
    case RestaurntDetailsView.id:
      return MaterialPageRoute(
        builder: (context) => const RestaurntDetailsView(),
      );

    default:
      return MaterialPageRoute(
        builder:
            (context) =>
                const Scaffold(body: Center(child: Text('Route not found'))),
      );
  }
}
