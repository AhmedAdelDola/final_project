import 'package:autism_app/Core/Utils/Assets/images/app_images.dart';
import 'package:autism_app/Core/Utils/Colors/app_colors.dart';
import 'package:autism_app/Core/Utils/Routing/app_routes.dart';
import 'package:autism_app/Core/Utils/Text/text_style.dart';
import 'package:autism_app/Core/Utils/widgets/custom_back_button.dart';
import 'package:autism_app/Core/Utils/widgets/custom_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.whiteColor, // Light pink at the top
              AppColors.SplashColor2, // Light blue at the bottom
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 79.h,
              ),
              CustomBackButton(),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.h),
                    Center(
                      child: AutoSizeText(
                        'Welcome to BrightPath!',
                        style: AppTextStyles.style18black500.copyWith(
                            fontSize: 24.sp, color: AppColors.buttonColor),
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(height: 26.h),
                    Center(
                      child: Image.asset(AppImages.Welcome),
                    ), // Replace with your image path
                    SizedBox(height: 26.h),
                    SizedBox(
                      height: 185.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(AppImages.leftarrow),
                              Image.asset(AppImages.rightarrow),
                            ],
                          ),
                          AutoSizeText(
                            textAlign: TextAlign.center,
                            'Learn,Laugh,\nLive!',
                            style: AppTextStyles.poppins24blue700,
                            maxLines: 1,
                          ),
                          Container(
                            width: 191.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.buttonColor, width: 1.h)),
                          ),
                          Container(
                            width: 153.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.buttonColor, width: 1.h)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 20,
                          color: Color(0xff407CE2),
                        ),
                        AutoSizeText(
                          'Learning and Support for your child!',
                          style: AppTextStyles.poppins24blue700
                              .copyWith(fontSize: 15.sp),
                          maxLines: 1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Center(
                      child: SizedBox(
                        height: 25.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Choose your app',
                              style: AppTextStyles.style14gray500.copyWith(
                                  fontSize: 16.sp, color: Color(0xFF131759)),
                              maxLines: 1,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Color(0xFF004BCA),
                              size: 40,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CustomButton(
                              buttonStyle: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      AppColors.whiteColor),
                                  fixedSize:
                                      WidgetStatePropertyAll(Size(169.w, 56.h)),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 3,
                                              color: Color.fromRGBO(
                                                  68, 127, 227, 60)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))))),
                              hight: 56.h,
                              width: 169.w,
                              ontap: () {
                                NavigatetoParentHub(context);
                              },
                              txt: 'Parent Hub',
                              style: AppTextStyles.style20weight600
                                  .copyWith(color: Color(0xFF447FE3)),
                            ),
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          Expanded(
                            child: CustomButton(
                                hight: 56.h,
                                width: 169.w,
                                ontap: () {
                                  NavigatetoKidsHub(context);
                                },
                                txt: 'Kid Zone'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  NavigatetoParentHub(context) {
    Navigator.pushReplacementNamed(context, AppRoutes.parent_home);
  }

  NavigatetoKidsHub(context) {
    Navigator.pushReplacementNamed(context, AppRoutes.childSplash);
  }
}
