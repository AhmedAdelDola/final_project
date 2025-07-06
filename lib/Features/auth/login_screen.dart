import 'package:autism_app/Core/Utils/Assets/icons/app_icons.dart';
import 'package:autism_app/Core/Utils/Colors/app_colors.dart';
import 'package:autism_app/Core/Utils/Routing/app_routes.dart';
import 'package:autism_app/Core/Utils/Text/text_style.dart';
import 'package:autism_app/Core/Utils/widgets/custom_button.dart';
import 'package:autism_app/Features/auth/cubit/auth_cubit.dart';
import 'package:autism_app/Features/auth/cubit/auth_state.dart';
import 'package:autism_app/Features/auth/widgets/custom_socialbutton.dart';
import 'package:autism_app/Features/auth/widgets/custom_textformfield.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 162.h,
                ),
                AutoSizeText('Login', style: AppTextStyles.style32black600),
                AutoSizeText('Please Login to continue using the app',
                    style: AppTextStyles.style14gray400),
                SizedBox(height: 40.h),
                AutoSizeText('Email', style: AppTextStyles.style18black500),
                SizedBox(height: 6.h),
                CustomTextField(
                  controller: emailController,
                  hintText: 'Enter your email or phone number',
                  keyboardType: TextInputType.emailAddress,
                  prefix: Image.asset(AppIcons.phone),
                ),
                SizedBox(height: 13.h),
                AutoSizeText('Password', style: AppTextStyles.style18black500),
                SizedBox(height: 6.h),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  obscureText: true,
                  prefix: Image.asset(AppIcons.lock),
                  suffix: IconButton(
                      onPressed: () {}, icon: Icon(Icons.remove_red_eye)),
                ),
                SizedBox(
                  height: 36.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 21.h,
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: AppColors.buttonColor,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              fillColor: WidgetStatePropertyAll(
                                  Color.fromRGBO(217, 217, 217, 0.16)),
                              side: BorderSide(
                                  width: 1.w,
                                  color: Color.fromRGBO(180, 180, 180, 0.8)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              value: false,
                              onChanged: (value) {},
                            ),
                            AutoSizeText(
                              'Remember me?',
                              style: AppTextStyles.style14gray500,
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          navigateToResetPassword(context);
                        },
                        child: AutoSizeText(
                          'Forgot password?',
                          style: AppTextStyles.style14gray500
                              .copyWith(color: AppColors.buttonColor),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 29.h),
                CustomButton(
                  ontap: () {
                    context
                        .read<AuthCubit>()
                        .login(emailController.text, passwordController.text)
                        .then(
                      (value) {
                        if (context.read<AuthCubit>().authResponseModel !=
                            null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login Successful')),
                          );
                          navigateToWelcome(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login Failed')),
                          );
                        }
                      },
                    );
                  },
                  hight: 56,
                  width: 337,
                  txt: 'Sign In',
                ),
                SizedBox(height: 29.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 105.w,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0xFF5E5E5E))),
                    ),
                    AutoSizeText(
                      'or',
                      style: AppTextStyles.style20weight600.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6E6E6E)),
                    ),
                    Container(
                      width: 105.w,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0xFF5E5E5E))),
                    ),
                  ],
                ),
                SizedBox(height: 21.h),
                Column(
                  spacing: 13.h,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomSocialButton(
                      imagePath: AppIcons.facebook,
                      onTap: () {
                        // Handle Facebook login
                      },
                      txt: 'Continue with Facebook',
                    ),
                    CustomSocialButton(
                      imagePath: AppIcons.google,
                      onTap: () {
                        // Handle Google login
                      },
                      txt: 'Continue with Google',
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 2.w,
                  children: [
                    AutoSizeText(
                      'Donot have account?',
                      style: AppTextStyles.poppins16black400.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(113, 113, 113, 1)),
                    ),
                    TextButton(
                      style: ButtonStyle(
                          padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                      onPressed: () {
                        navigateToSignUp(context);
                      },
                      child: AutoSizeText(
                        'Sign up',
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
        ),
      ),
    );
  }

  navigateToSignUp(context) {
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, AppRoutes.signup);
  }

  navigateToResetPassword(context) {
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, AppRoutes.resetpassword);
  }

  navigateToWelcome(context) {
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, AppRoutes.welcome);
  }
}
