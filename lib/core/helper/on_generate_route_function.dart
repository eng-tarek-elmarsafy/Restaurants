import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/core/services/auth_services.dart';
import 'package:restaurants/core/services/supabase/supabase_auth_services_impl.dart';
import 'package:restaurants/features/auth/data/repo/auth_repo_impl.dart';
import 'package:restaurants/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
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
              create:
                  (context) => SignUpCubit(
                    AuthRepoImpl(authServices: SupabaseAuthEmailServicesImpl()),
                  ),
              child: const SignUpView(),
            ),
      );
    case MainView.id:
      return MaterialPageRoute(builder: (context) => const MainView());
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
