import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.onChanged});
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            errorBorder: buildOutlineInputBorder(),
            hintText: "search",
            hintStyle: TextStyle(color: AppColors.white),
            suffixIcon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 22)),
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
