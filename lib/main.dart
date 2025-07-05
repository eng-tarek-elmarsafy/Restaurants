import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/helper/get_it_setup.dart';
import 'package:restaurants/core/helper/on_generate_route_function.dart';
import 'package:restaurants/core/services/supabase/supabase_initializing.dart';
import 'package:restaurants/features/splash/presentation/views/splash_view.dart';
import 'package:restaurants/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SupabaseInitializing.initializing();
  setup();
  runApp(const Restaurants());
}

class Restaurants extends StatelessWidget {
  const Restaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
