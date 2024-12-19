import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/features/search/presentation/widgets/items_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // controller: _scrollController,
      itemCount: books.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GestureDetector(
            onTap: () {
              BookEntity book = books[index];
              book.bookId = book.bookId + book.bookId + book.bookId;
              GoRouter.of(context).push(AppRouter.homeViewDetails, extra: book);
            },
            child: ItemsWidget(books: books[index]),
          ),
        );
      },
    );
  }
}

// final ScrollController _scrollController = ScrollController();
  // int nextPage = 1;
  // bool isLoading = false;
  // @override
  // void initState() {
  //   super.initState();
  //   _scrollController.addListener(_onScroll);
  // }

  // void _onScroll() async {
  //   final currentPossition = _scrollController.position.pixels;
  //   final maxScrollLength = _scrollController.position.maxScrollExtent;
  //   if (currentPossition >= maxScrollLength * 0.7) {
  //     if (!isLoading) {
  //       isLoading = true;
  //       await BlocProvider.of<GetAllBooksCubit>(context)
  //           .fetchAllBooks(pageNumber: nextPage++);
  //       isLoading = false;
  //     }
  //   }
  // }

  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }