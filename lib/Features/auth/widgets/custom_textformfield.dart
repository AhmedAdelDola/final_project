import 'package:autism_app/Core/Utils/Text/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffix;
  final Widget? prefix;
  final TextEditingController? controller;
  void Function()? onTap;

  CustomTextField({
    Key? key,
    required this.hintText,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffix,
    this.prefix,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: onTap,
      decoration: InputDecoration(
        constraints: BoxConstraints(
            minHeight: 56.h, minWidth: 337.w, maxHeight: 56.h, maxWidth: 337.w),
        hintText: hintText,
        hintStyle: AppTextStyles.style14grays500,
        suffixIcon: suffix,
        prefixIcon: prefix,
        filled: true,
        fillColor: Color.fromRGBO(243, 242, 242, 0.75),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(180, 180, 180, 0.5), width: 1),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(180, 180, 180, 0.5), width: 1),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}
