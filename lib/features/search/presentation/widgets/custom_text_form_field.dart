import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, this.onChanged, this.suffixIcon, required this.controller});
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          errorBorder: buildOutlineInputBorder(),
          hintText: "search",
          hintStyle: TextStyle(color: AppColors.white),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.white),
    );
  }
}
