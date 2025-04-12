import 'package:autism_app/Core/Utils/Assets/icons/app_icons.dart';
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

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

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
                  AutoSizeText('Please enter your new password',
                      style: AppTextStyles.style14gray400),
                  SizedBox(height: 50.h),
                  CustomTextField(
                    hintText: 'Enter your password',
                    keyboardType: TextInputType.visiblePassword,
                    prefix: Image.asset(
                      AppIcons.lock,
                      color: Color.fromRGBO(64, 124, 226, 90),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  CustomTextField(
                    hintText: 'Enter your password again',
                    keyboardType: TextInputType.visiblePassword,
                    prefix: Image.asset(
                      AppIcons.lock,
                      color: Color.fromRGBO(64, 124, 226, 90),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  CustomButton(
                    ontap: () {
                      navigateToSucces(context);
                    },
                    hight: 64,
                    width: 337,
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

  navigateToSucces(context) {
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, AppRoutes.succes);
  }
}
