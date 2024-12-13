import 'package:bookly_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    this.borderRadius,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
  });
  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius:
                  borderRadius ?? const BorderRadius.all(Radius.circular(16)))),
      onPressed: () {},
      child: Text(text,
          style:
              AppStyles.styleSemiBolde18(context).copyWith(color: textColor)),
    );
    // return Container(
    //   alignment: Alignment.center,
    //   height: 40,
    //   decoration: const BoxDecoration(
    //     color: AppColors.white,
    //     borderRadius: BorderRadius.only(
    // bottomLeft: Radius.circular(16),
    // topLeft: Radius.circular(16),
    //     ),
    //   ),
    //   child: const Text("19.99\$"),
    // );
  }
}
