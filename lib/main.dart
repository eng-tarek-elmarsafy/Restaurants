import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/helper/on_generate_route_function.dart';
import 'package:restaurants/features/splash/presentation/views/splash_view.dart';
import 'package:restaurants/generated/l10n.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ngzkhpjctpjtjmcfuiri.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5nemtocGpjdHBqdGptY2Z1aXJpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE1MzY1ODQsImV4cCI6MjA2NzExMjU4NH0.aX_D9E2l-Z0tw9o6AUsSRa9yQVgLGg7OrsayIt_jTRM',
  );

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
