import 'package:bookly_app/core/utils/shared/custom_book_image.dart';
import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/core/utils/app_style.dart';
import 'package:bookly_app/core/utils/shared/book_rating.dart';
import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({
    super.key,
    required this.books,
  });

  final BookEntity books;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 125,
          child: CustomBookImage(
              imageUrl: books.image ?? "",
              id: books.bookId + books.bookId + books.bookId,
              aspectRatio: 2.5 / 4),
        ),
        const SizedBox(width: 16),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(books.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.styleRegular20(context).copyWith(height: 1.2)),
            const SizedBox(height: 3),
            Text(books.authorName ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.styleRegular20(context)
                    .copyWith(color: Colors.white.withOpacity(0.8))),
            const SizedBox(height: 3),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Free'),
              BookRating(
                  ratingStar: books.rating ?? 0,
                  ratingNumber: books.ratingCount ?? 0),
            ])
          ]),
        ),
      ],
    );
  }
}
