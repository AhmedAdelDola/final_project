import 'package:autism_app/Features/auth/change_password.dart';
import 'package:autism_app/Features/auth/change_succes.dart';
import 'package:autism_app/Features/auth/login_screen.dart';
import 'package:autism_app/Features/auth/rest_password.dart';
import 'package:autism_app/Features/auth/signup.dart';
import 'package:autism_app/Features/auth/verify.dart';
import 'package:autism_app/Features/child_view/splash/splash.dart';
import 'package:autism_app/Features/on_boarding/on_boarding.dart';
import 'package:autism_app/Features/parent_view/home_screen/home_layout.dart';
import 'package:autism_app/Features/parent_view/home_screen/home_screen.dart';
import 'package:autism_app/Features/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../../Features/welcome_screen/welcome_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onBoarding = 'onBoarding';
  static const String login = 'login';
  static const String signup = 'signup';
  static const String resetpassword = 'resetpassword';
  static const String verify = 'verify';
  static const String changepassword = 'changepassword';
  static const String succes = 'succes';
  static const String welcome = 'welcome';
  static const String parent_home = 'parent_home';
  static const String childSplash = 'childSplash';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return CupertinoPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );
      case onBoarding:
        return CupertinoPageRoute(
          builder: (context) {
            return const OnBoarding();
          },
        );
      case login:
        return CupertinoPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        );
      case signup:
        return CupertinoPageRoute(
          builder: (context) {
            return const SignUp();
          },
        );
      case resetpassword:
        return CupertinoPageRoute(
          builder: (context) {
            return const ResetPassword();
          },
        );
      case verify:
        return CupertinoPageRoute(
          builder: (context) {
            return const Verify();
          },
        );
      case changepassword:
        return CupertinoPageRoute(
          builder: (context) {
            return const ChangePassword();
          },
        );
      case succes:
        return CupertinoPageRoute(
          builder: (context) {
            return const Succes();
          },
        );
      case welcome:
        return CupertinoPageRoute(
          builder: (context) {
            return const WelcomeScreen();
          },
        );
      case parent_home:
        return CupertinoPageRoute(
          builder: (context) {
            return const HomeLayout();
          },
        );
      case childSplash:
        return CupertinoPageRoute(
          builder: (context) {
            return const ChildSplash();
          },
        );
      default:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
