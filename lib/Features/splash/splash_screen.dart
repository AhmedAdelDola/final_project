import 'package:autism_app/Core/Utils/Assets/images/app_images.dart';
import 'package:autism_app/Core/Utils/Colors/app_colors.dart';
import 'package:autism_app/Core/Utils/Routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToOnBoarding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw, // Full screen width
        height: 1.sh, // Full screen height
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.SplashColor1, // Light pink at the top
              AppColors.SplashColor2, // Light blue at the bottom
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            AppImages.splashImage,
            width: 800.w, // Responsive width
            height: 800.h, // Responsive height
          ),
        ),
      ),
    );
  }

  navigateToOnBoarding() {
    Future.delayed(const Duration(seconds: 5), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, AppRoutes.onBoarding);
    });
  }
}
