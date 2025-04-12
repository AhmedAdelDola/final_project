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

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
                  AutoSizeText('Reset Password',
                      style: AppTextStyles.style32black600),
                  AutoSizeText('Please enter your email for verification code',
                      style: AppTextStyles.style14gray400),
                  Image.asset(AppImages.resetPassword),
                  SizedBox(height: 36.h),
                  AutoSizeText('Email', style: AppTextStyles.style18black500),
                  SizedBox(height: 6.h),
                  CustomTextField(
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    prefix: Image.asset(AppIcons.email),
                  ),
                  SizedBox(height: 17.h),
                  Center(
                    child: AutoSizeText(
                      'Code will Send to your Email',
                      style:
                          AppTextStyles.style14gray500.copyWith(fontSize: 15),
                    ),
                  ),
                  SizedBox(height: 60.h),
                  CustomButton(
                    ontap: () {
                      navigateToVerify(context);
                    },
                    hight: 64,
                    width: 377,
                    txt: 'Send Code',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  navigateToVerify(context) {
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, AppRoutes.verify);
  }
}
