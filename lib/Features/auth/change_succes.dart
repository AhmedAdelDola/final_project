import 'package:autism_app/Core/Utils/Assets/icons/app_icons.dart';
import 'package:autism_app/Core/Utils/Assets/images/app_images.dart';
import 'package:autism_app/Core/Utils/Colors/app_colors.dart';
import 'package:autism_app/Core/Utils/Routing/app_routes.dart';
import 'package:autism_app/Core/Utils/Text/text_style.dart';
import 'package:autism_app/Core/Utils/widgets/custom_back_button.dart';
import 'package:autism_app/Core/Utils/widgets/custom_button.dart';
import 'package:autism_app/Features/auth/widgets/custom_socialbutton.dart';
import 'package:autism_app/Features/auth/widgets/custom_textformfield.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Succes extends StatelessWidget {
  const Succes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 79.h,
            ),
            CustomBackButton(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35.h,
                  ),
                  AutoSizeText('Password Changed',
                      style: AppTextStyles.style32black600),
                  SizedBox(
                    height: 87.h,
                  ),
                  Image.asset(AppImages.Successfully),
                  SizedBox(height: 8.h),
                  Center(
                    child: AutoSizeText(
                      textAlign: TextAlign.center,
                      'Password has been changed successfully',
                      style: AppTextStyles.style20weight600
                          .copyWith(color: AppColors.blackColor),
                    ),
                  ),
                  SizedBox(height: 60.h),
                  CustomButton(
                    ontap: () {
                      navigateToLogin(context);
                    },
                    hight: 64,
                    width: 377,
                    txt: 'Continue',
                  ),
                ],
              ),
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
