import 'package:bookly_app/core/utils/app_style.dart';
import 'package:bookly_app/features/home/presentation/widgets/action_details_button.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_book_item.dart';
import 'package:flutter/widgets.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: const CustomBookImage(
            imageUrl: "",
          ),
        ),
        Text("The Jungle Book", style: AppStyles.styleSemiBold25(context)),
        Opacity(
          opacity: 0.7,
          child: Text("Rudyard Kipling",
              style: AppStyles.styleSemiBolde18(context)
                  .copyWith(fontStyle: FontStyle.italic)),
        ),
        const SizedBox(height: 18),
        const BookRating(ratingNumber: 2422, ratingStar: 4.2),
        const SizedBox(height: 20),
        const ActionButton(),
      ],
    );
  }
}
