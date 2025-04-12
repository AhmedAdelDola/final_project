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
import 'package:pinput/pinput.dart';

class Verify extends StatelessWidget {
  const Verify({super.key});

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
                  AutoSizeText('Verification',
                      style: AppTextStyles.style32black600),
                  AutoSizeText('We have sent s code to your email',
                      style: AppTextStyles.style14gray400),
                  SizedBox(height: 87.h),
                  Pinput(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    length: 5,
                    keyboardType: TextInputType.number,
                    closeKeyboardWhenCompleted: true,
                    preFilledWidget: AutoSizeText('_'),
                    defaultPinTheme: PinTheme(
                        width: 60.h,
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Color.fromRGBO(218, 218, 218, 10),
                          border:
                              Border.all(color: Color(0xFFA1A1A1), width: 1),
                        ),
                        textStyle: AppTextStyles.style18black500
                            .copyWith(fontSize: 24.sp)),
                  ),
                  SizedBox(height: 21.h),
                  Center(
                    child: AutoSizeText(
                      'Code will expire in 5 minutes',
                      style:
                          AppTextStyles.style14gray500.copyWith(fontSize: 15),
                    ),
                  ),
                  SizedBox(height: 60.h),
                  CustomButton(
                    ontap: () {
                      navigateToNewPassword(context);
                    },
                    hight: 64,
                    width: 377,
                    txt: 'Verify ',
                  ),
                  SizedBox(height: 9.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 2.w,
                    children: [
                      AutoSizeText(
                        ' Didn\'t received the code?',
                        style:
                            AppTextStyles.style14gray500.copyWith(fontSize: 15),
                      ),
                      TextButton(
                        style: ButtonStyle(
                            padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                        onPressed: () {},
                        child: AutoSizeText(
                          'Resend',
                          style: AppTextStyles.style14gray500.copyWith(
                              fontSize: 15,
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

  navigateToNewPassword(context) {
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, AppRoutes.changepassword);
  }
}
