import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 50.h,
          height: 50.h,
          decoration: BoxDecoration(
              color: Color.fromRGBO(216, 211, 211, 0.2),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                  color: Color.fromRGBO(204, 204, 204, 0.51), width: 1)),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new,
              fill: 0.94,
              size: 15.w,
              weight: 0.94,
              color: Color.fromRGBO(44, 44, 44, 0.94),
            ),
          ),
        ),
      ),
    );
  }
}
