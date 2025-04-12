import 'package:autism_app/Core/Utils/Colors/app_colors.dart';
import 'package:autism_app/Core/Utils/Text/text_style.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.txt,
      required this.width,
      required this.hight,
      this.ontap,
      this.buttonStyle,
      this.style,
      this.child});
  final String? txt;
  final double width;
  final double hight;
  final void Function()? ontap;
  final ButtonStyle? buttonStyle;
  final TextStyle? style;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: buttonStyle ??
            ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.buttonColor),
                fixedSize: WidgetStatePropertyAll(Size(width.w, hight.h)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))))),
        onPressed: ontap,
        child: txt != null
            ? AutoSizeText(
                txt!,
                style: style ?? AppTextStyles.style20weight600,
                maxLines: 1,
              )
            : child);
  }
}
