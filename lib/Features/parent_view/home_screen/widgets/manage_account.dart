import 'package:autism_app/Core/Utils/Assets/icons/app_icons.dart';
import 'package:autism_app/Core/Utils/Assets/images/app_images.dart';
import 'package:autism_app/Core/Utils/Text/text_style.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManageAcc extends StatelessWidget {
  const ManageAcc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r)),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF8E86FD), Color(0xFF3BB9F4)])),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 23.w,
                            child: Image.asset(
                              AppImages.Maria,
                              width: 50.h,
                              height: 40.h,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(' Maria',
                                  style: AppTextStyles.style20weight600),
                              AutoSizeText('View kid profile',
                                  style: AppTextStyles.style20weight600
                                      .copyWith(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 11.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                strokeAlign: BorderSide.strokeAlignInside,
                                color: Color.fromRGBO(204, 204, 204, 0.21),
                                width: 1),
                            borderRadius: BorderRadius.circular(20.r),
                            color: Color.fromRGBO(157, 160, 253, 0.72),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 11.w, vertical: 15.h),
                            child: Row(
                              spacing: 3.w,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText('Manage',
                                    style: AppTextStyles.style20weight600
                                        .copyWith(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500)),
                                Image.asset(AppIcons.edit)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Image.asset(AppIcons.pin))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(blurRadius: 4, color: Colors.transparent)
                  ]),
                  child: AutoSizeText(
                    'Record your Childs behaviors for a minimum of 5 days to get your first report',
                    style: AppTextStyles.style20weight600.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
            SizedBox(
              height: 13.h,
            ),
          ],
        ),
      ),
    );
  }
}
