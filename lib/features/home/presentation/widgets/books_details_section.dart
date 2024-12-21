import 'package:bookly_app/core/utils/app_style.dart';
import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/widgets/action_details_button.dart';
import 'package:bookly_app/core/utils/shared/book_rating.dart';
import 'package:bookly_app/core/utils/shared/custom_book_image.dart';
import 'package:flutter/widgets.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({
    super.key,
    required this.book,
  });
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImage(
            id: book.bookId,
            imageUrl: book.image ?? "",
          ),
        ),
        Text(
          book.title,
          style: AppStyles.styleSemiBold25(context),
          textAlign: TextAlign.center,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(book.authorName ?? "",
              style: AppStyles.styleSemiBolde18(context)
                  .copyWith(fontStyle: FontStyle.italic)),
        ),
        const SizedBox(height: 18),
        BookRating(
            ratingNumber: book.ratingCount ?? 0, ratingStar: book.rating ?? 0),
        const SizedBox(height: 20),
        ActionButton(book: book),
      ],
    );
  }
}
