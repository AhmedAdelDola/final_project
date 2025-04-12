import 'package:autism_app/Core/Utils/Assets/icons/app_icons.dart';
import 'package:autism_app/Core/Utils/Text/text_style.dart';
import 'package:autism_app/Core/Utils/widgets/custom_button.dart';
import 'package:autism_app/Features/parent_view/home_screen/widgets/manage_account.dart';
import 'package:autism_app/Features/parent_view/home_screen/widgets/diaryentry.dart';
import 'package:autism_app/Features/parent_view/home_screen/widgets/home_appbar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeAppbar(),
          ManageAcc(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Container(
              // height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
