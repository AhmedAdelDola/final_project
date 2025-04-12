import 'package:autism_app/Core/Utils/Text/text_style.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSocialButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  final String txt;

  const CustomSocialButton({
    Key? key,
    required this.imagePath,
    required this.onTap,
    required this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color.fromRGBO(243, 242, 242, 0.75),
          borderRadius: BorderRadius.circular(8),
          border:
              Border.all(color: Color.fromRGBO(180, 180, 180, 0.5), width: 1),
        ),
        child: Row(
          spacing: 18.w,
          children: [
            Image.asset(imagePath),
            AutoSizeText(
                style: AppTextStyles.style14gray500.copyWith(
                    fontSize: 17.sp, color: Color.fromRGBO(76, 76, 76, 0.8)),
                txt)
          ],
        ),
      ),
    );
  }
}
