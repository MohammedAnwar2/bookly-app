import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_book_cubit/similar_book_cubit.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarListView extends StatefulWidget {
  const SimilarListView({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;

  @override
  State<SimilarListView> createState() => _SimilarListViewState();
}

class _SimilarListViewState extends State<SimilarListView> {
  final ScrollController _scrollController = ScrollController();
  int nextPage = 1;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    final currentPossition = _scrollController.position.pixels;
    final maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPossition >= maxScrollLength * 0.7) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<SimilarBookCubit>(context)
            .fetchSimilardBooks(pageNumer: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .2,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(
                start: 12, end: widget.books.length - 1 == index ? 24 : 0),
            child: GestureDetector(
              onTap: () {
                BookEntity book = widget.books[index];
                book.bookId = book.bookId + book.bookId;
                GoRouter.of(context)
                    .push(AppRouter.homeViewDetails, extra: book);
              },
              child: CustomBookImage(
                  imageUrl: widget.books[index].image ?? "",
                  id: widget.books[index].bookId + widget.books[index].bookId),
            ),
          );
        },
      ),
    );
  }
}
