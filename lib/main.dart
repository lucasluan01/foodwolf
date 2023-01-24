import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodwolf/config/theme/app_colors.dart';
import 'package:foodwolf/config/theme/color_schemes.g.dart';
import 'package:foodwolf/screens/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Wolf',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: AppColors.bodyText,
              ),
        ),
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        colorScheme: lightColorScheme,
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: AppColors.neutral_0,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: AppColors.neutral_1,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(250, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            fixedSize: const Size(0, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            side: const BorderSide(
              width: 1,
              color: AppColors.neutral_1,
            ),
          ),
        ),
        buttonTheme: const ButtonThemeData(
          height: 50,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
