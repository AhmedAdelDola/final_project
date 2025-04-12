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

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                  AutoSizeText('Create Account',
                      style: AppTextStyles.style32black600),
                  AutoSizeText('Please Login to continue using the app',
                      style: AppTextStyles.style14gray400),
                  SizedBox(height: 40.h),
                  AutoSizeText('Username',
                      style: AppTextStyles.style18black500),
                  SizedBox(height: 6.h),
                  CustomTextField(
                    hintText: 'xxxxxxxxxxxx',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 13.h),
                  AutoSizeText('Email Address',
                      style: AppTextStyles.style18black500),
                  SizedBox(height: 6.h),
                  CustomTextField(
                    hintText: 'mg2@gmail.com',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 13.h),
                  AutoSizeText('Password',
                      style: AppTextStyles.style18black500),
                  SizedBox(height: 6.h),
                  CustomTextField(
                    hintText: '*************',
                    obscureText: true,
                    suffix: IconButton(
                        onPressed: () {}, icon: Icon(Icons.remove_red_eye)),
                  ),
                  SizedBox(height: 13.h),
                  AutoSizeText('Confirm Password',
                      style: AppTextStyles.style18black500),
                  SizedBox(height: 6.h),
                  CustomTextField(
                    hintText: '*************',
                    obscureText: true,
                    suffix: IconButton(
                        onPressed: () {}, icon: Icon(Icons.remove_red_eye)),
                  ),
                  SizedBox(height: 40.h),
                  CustomButton(
                    ontap: () {},
                    hight: 56,
                    width: 337,
                    txt: 'Sign Up',
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 2.w,
                    children: [
                      AutoSizeText(
                        'Already have account?',
                        style: AppTextStyles.poppins16black400.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(113, 113, 113, 1)),
                      ),
                      TextButton(
                        style: ButtonStyle(
                            padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                        onPressed: () {
                          navigateToLogin(context);
                        },
                        child: AutoSizeText(
                          'Sign In',
                          style: AppTextStyles.poppins16black400.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(33, 102, 218, 1)),
                        ),
                      )
                    ],
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
