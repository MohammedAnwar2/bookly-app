import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBookListView extends StatefulWidget {
  const FeaturedBookListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  State<FeaturedBookListView> createState() => _FeaturedBookListViewState();
}

class _FeaturedBookListViewState extends State<FeaturedBookListView> {
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
        await BlocProvider.of<FeaturedBookCubit>(context)
            .fetchFeaturedBooks(pageNumber: nextPage++);
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
      height: MediaQuery.sizeOf(context).height * .3,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(
              start: index == 0 ? 24 : 12,
              end: index == widget.books.length - 1 ? 24 : 0,
            ),
            child: GestureDetector(
              onTap: () {
                BookEntity subBook = widget.books[index];
                subBook.bookId = subBook.bookId + index.toString();
                GoRouter.of(context)
                    .push(AppRouter.homeViewDetails, extra: subBook);
              },
              child: CustomBookImage(
                  imageUrl: widget.books[index].image ?? "",
                  id: widget.books[index].bookId + index.toString()),
            ),
          );
        },
      ),
    );
  }
}
