import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/helper/on_generate_route_function.dart';
import 'package:restaurants/features/splash/presentation/views/splash_view.dart';
import 'package:restaurants/generated/l10n.dart';

void main() {
  runApp(const Restaurants());
}

class Restaurants extends StatelessWidget {
  const Restaurants({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
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
