import 'package:autism_app/Core/Utils/Assets/images/app_images.dart';
import 'package:autism_app/Core/Utils/Colors/app_colors.dart';
import 'package:autism_app/Core/Utils/Routing/app_routes.dart';
import 'package:autism_app/Core/Utils/Text/text_style.dart';
import 'package:autism_app/Core/Utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: 1.sw,
        height: 1.sh,
        child: Column(
          spacing: 20.h,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.OnBoarding,
              height: 300.h,
              width: 300.w,
            ),
            Text(
                textAlign: TextAlign.center,
                style: AppTextStyles.poppins30black500,
                "Let's start journey\n with BrightPath"),
            Text(
                textAlign: TextAlign.center,
                style: AppTextStyles.poppins16black400,
                "You can explore this journey with your kids\n journey full of knowledge and fun"),
            Container(
              width: 37.w,
              decoration: BoxDecoration(
                  border: Border.all(width: 3, color: AppColors.buttonColor),
                  borderRadius: BorderRadius.circular(100)),
            ),
            SizedBox(
              height: 223.h,
            ),
            CustomButton(
              txt: 'Next',
              width: 394,
              hight: 64,
              ontap: () {
                navigateToLogin(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  navigateToLogin(context) {
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }
}
