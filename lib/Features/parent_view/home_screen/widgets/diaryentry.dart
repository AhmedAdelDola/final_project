import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiaryEntry extends StatelessWidget {
  final String day;
  final bool isCompleted;

  const DiaryEntry({
    Key? key,
    required this.day,
    required this.isCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            day,
            style: TextStyle(
              fontSize: 14.sp,
            ),
            maxLines: 1,
          ),
          SizedBox(height: 4.h),
          if (isCompleted)
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 24.r,
            )
          else
            Icon(
              Icons.circle,
              color: Colors.grey,
              size: 24.r,
            ),
        ],
      ),
    );
  }
}
