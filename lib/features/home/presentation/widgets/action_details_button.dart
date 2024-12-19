import 'package:bookly_app/core/utils/functions/custom_url_luncher.dart';
import 'package:bookly_app/core/utils/shared/custom_button.dart';
import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.book,
  });
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal:
              width > 600 ? MediaQuery.sizeOf(context).width * .15 : 16),
      child: Row(
        children: [
          if (width > 315)
            Expanded(
              child: CustomButtom(
                text: "Free",
                backgroundColor: AppColors.white,
                textColor: AppColors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
              ),
            ),
          Expanded(
            child: CustomButtom(
              onPressed: () async {
                await customUrlLuncher(context,
                    bookUrl: book.previewLink ?? "");
              },
              text: "Free preview",
              backgroundColor: AppColors.orange,
              textColor: AppColors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(width < 315 ? 16 : 0),
                topLeft: Radius.circular(width < 315 ? 16 : 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
