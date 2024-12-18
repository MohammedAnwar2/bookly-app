import 'package:bookly_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    this.borderRadius,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    this.onPressed,
  });
  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius:
                  borderRadius ?? const BorderRadius.all(Radius.circular(16)))),
      onPressed: onPressed,
      child: Text(text,
          style:
              AppStyles.styleSemiBolde16(context).copyWith(color: textColor)),
    );
  }
}
