import 'package:bookly_app/core/utils/app_style.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_book_item.dart';
import 'package:bookly_app/features/search/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(),
          SizedBox(height: 10),
          Text("Best Seller", style: AppStyles.styleSemiBolde18(context)),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      // BookEntity book = widget.books[index];
                      // book.bookId = book.bookId + book.bookId;
                      // GoRouter.of(context)
                      //     .push(AppRouter.homeViewDetails, extra: book);
                    },
                    child: CustomBookImage(
                        imageUrl:
                            "http://books.google.com/books/content?id=BwsDAAAAIAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                        id: '1'),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
