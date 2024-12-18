import 'package:bookly_app/features/home/presentation/widgets/custom_book_item.dart';
import 'package:bookly_app/features/search/domain/entities/search_book_entities.dart';
import 'package:flutter/material.dart';

class AnotherItemSearchListView extends StatelessWidget {
  const AnotherItemSearchListView({
    super.key,
    required this.books,
  });
  final List<SearchBookEntities> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
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
            child: CustomBookImage(imageUrl: books[index].image ?? "", id: '1'),
          ),
        );
      },
    );
  }
}
