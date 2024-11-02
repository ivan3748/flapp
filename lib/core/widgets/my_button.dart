import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/custom_text_style.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color color;
  final TextStyle? style;
  final void Function()? onTap;
  const MyButton(
      {super.key,
      required this.text,
      this.onTap,
      this.style,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 62.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: CustomTextStyles.font18secondary,
          ),
        ),
      ),
    );
  }
}
