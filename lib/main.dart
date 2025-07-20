import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/helper/get_it_setup.dart';
import 'package:restaurants/core/helper/on_generate_route_function.dart';
import 'package:restaurants/core/services/shared_preferences.dart';
import 'package:restaurants/core/services/supabase/supabase_initializing.dart';
import 'package:restaurants/core/services/supabase/upload_file_impl.dart';
import 'package:restaurants/features/acconut/domain/repo/account_repo.dart';
import 'package:restaurants/features/acconut/presentation/manager/update_user_data_cubit/update_user_data_cubit.dart';
import 'package:restaurants/features/auth/domain/repo/auth_repo.dart';
import 'package:restaurants/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:restaurants/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:restaurants/features/home/domain/repo/home_repo.dart';
import 'package:restaurants/features/home/presentation/manager/get_restaurants_cubit/get_restaurants_cubit.dart';
import 'package:restaurants/features/restaurant_details/domain/repo/menu_repo.dart';
import 'package:restaurants/features/restaurant_details/domain/repo/rating_repo.dart';
import 'package:restaurants/features/restaurant_details/presentation/manager/get_meun_cubit/get_menu_cubit.dart';
import 'package:restaurants/features/restaurant_details/presentation/manager/get_rating_cubit/get_rating_cubit.dart';
import 'package:restaurants/features/splash/presentation/views/splash_view.dart';
import 'package:restaurants/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SupabaseInitializing.initializing();
  await Prefs.inti();
  setup();
  // log(Prefs.getBool(kIsSignIn).toString());
  // log(Prefs.getString(kUserId).toString());
  // await DataStorServicesImpl().getData(BackendEndpoint.getData);
  runApp(const Restaurants());
}

class Restaurants extends StatelessWidget {
  const Restaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignInCubit(getIt.get<AuthRepo>())),
        BlocProvider(create: (context) => SignUpCubit(getIt.get<AuthRepo>())),
        BlocProvider(
          create: (context) => GetRestaurantsCubit(getIt.get<HomeRepo>()),
        ),
        BlocProvider(create: (context) => GetMenuCubit(getIt.get<MeunRepo>())),
        BlocProvider(
          create: (context) => GetRatingCubit(getIt.get<RatingRepo>()),
        ),
        BlocProvider(
          create:
              (context) => UpdateUserDataCubit(
                getIt.get<AccountRepo>(),
                getIt.get<UploadFile>(),
              ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: kPrimaryColor),
          scaffoldBackgroundColor: kPrimaryColor,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(kNeutralColor),
            ),
          ),
        ),
        initialRoute: SplashView.id,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
