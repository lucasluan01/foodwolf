import 'package:flutter/material.dart';
import 'package:foodwolf/screens/home_screen.dart';
import 'package:foodwolf/screens/login_screen.dart';
import 'package:foodwolf/screens/profile_screen.dart';
import 'package:foodwolf/screens/redefine_password_screen.dart';
import 'package:foodwolf/screens/register_screen.dart';
import 'package:foodwolf/screens/splash_screen.dart';
import 'package:foodwolf/screens/unverified_email_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> appRoutes = {
    '/': (context) => const SplashScreen(),
    '/home': (context) => const HomeScreen(),
    '/login': (context) => const LoginScreen(),
    '/register': (context) => const RegisterScreen(),
    '/profile': (context) => const ProfileScreen(),
    '/redefine-password': (context) => const RedefinePasswordScreen(),
    '/unverified-email': (context) => const UnverifiedEmailScreen(),
  };
}
