import 'package:bookly_app/core/utils/constants/app_colors.dart';
import 'package:bookly_app/core/utils/constants/app_style.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: AppColors.yellow),
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
