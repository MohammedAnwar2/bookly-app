import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star, color: AppColors.yellow, size: 18),
        const SizedBox(width: 6.3),
        Text("4.8", style: AppStyles.styleMedium14(context)),
        const SizedBox(width: 5),
        Text("(2490)",
            style: AppStyles.styleMedium14(context)
                .copyWith(color: AppColors.whiteLight)),
      ],
    );
  }
}
