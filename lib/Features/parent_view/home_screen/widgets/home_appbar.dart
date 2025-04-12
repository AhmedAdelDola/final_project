import 'package:autism_app/Core/Utils/Assets/icons/app_icons.dart';
import 'package:autism_app/Core/Utils/Text/text_style.dart';
import 'package:autism_app/Core/Utils/widgets/custom_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 307.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.r),
              bottomRight: Radius.circular(15.r)),
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color(0xFF1F7BFF), Color(0xFF134A99)])),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText('Hey, Mohamed',
                    style: AppTextStyles.style20weight600
                        .copyWith(fontSize: 23.sp)),
                Row(
                  children: [
                    Container(
                      width: 50.h,
                      height: 50.h,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.15),
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 6),
                                color: Color.fromRGBO(25, 101, 209, 0.7),
                                blurRadius: 19.8)
                          ],
                          border: Border.all(
                              strokeAlign: BorderSide.strokeAlignInside,
                              color: Color.fromRGBO(255, 255, 255, 0.19),
                              width: 1)),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.chat,
                          size: 20.w,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      width: 50.h,
                      height: 50.h,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.15),
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 6),
                                color: Color.fromRGBO(25, 101, 209, 0.7),
                                blurRadius: 19.8)
                          ],
                          border: Border.all(
                              strokeAlign: BorderSide.strokeAlignInside,
                              color: Color.fromRGBO(255, 255, 255, 0.19),
                              width: 1)),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.settings,
                          size: 20.w,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 2.h),
            AutoSizeText('Have a refreshing day!',
                style:
                    AppTextStyles.style20weight600.copyWith(fontSize: 15.sp)),
            SizedBox(height: 11.h),
            CustomButton(
              hight: 44,
              width: 97,
              buttonStyle: ButtonStyle(
                  padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 8.w)),
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  fixedSize: WidgetStatePropertyAll(Size(141.w, 39.h)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.52))))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.local_fire_department_outlined,
                    color: Color(0xFF1025AD),
                    size: 18.w,
                  ),
                  AutoSizeText(
                    '2-days streak',
                    style: AppTextStyles.style18black500
                        .copyWith(color: Color(0xFF1025AD), fontSize: 16.sp),
                  ),
                ],
              ),
              ontap: () {},
            ),
            SizedBox(height: 35.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 9.1,
                      blurStyle: BlurStyle.normal,
                      color: Color.fromRGBO(25, 101, 209, 0.7))
                ],
                border: Border.all(
                    strokeAlign: BorderSide.strokeAlignInside,
                    color: Color.fromRGBO(255, 255, 255, 0.15),
                    width: 1),
                borderRadius: BorderRadius.circular(8.r),
                color: Color.fromRGBO(255, 255, 255, 0.15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50.h,
                        height: 50.h,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.15),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 6),
                                  color: Color.fromRGBO(25, 101, 209, 0.7),
                                  blurRadius: 19.8)
                            ],
                            border: Border.all(
                                strokeAlign: BorderSide.strokeAlignInside,
                                color: Color.fromRGBO(255, 255, 255, 0.19),
                                width: 1)),
                        child: Image.asset(
                          width: 30.w,
                          height: 30.h,
                          AppIcons.lia,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        child: Column(
                          children: [
                            AutoSizeText('Chat with Lia',
                                style: AppTextStyles.style20weight600),
                            AutoSizeText('personal Ai Assist',
                                style: AppTextStyles.style20weight600.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                    hight: 44,
                    width: 97,
                    buttonStyle: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.white),
                        fixedSize: WidgetStatePropertyAll(Size(97.w, 44.h)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.52))))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          'Plus',
                          style: AppTextStyles.style18black500.copyWith(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              color: Color(0xFF1025AD)),
                        ),
                        Icon(
                          Icons.add,
                          color: Color(0xFF1025AD),
                          size: 18.w,
                        )
                      ],
                    ),
                    ontap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
