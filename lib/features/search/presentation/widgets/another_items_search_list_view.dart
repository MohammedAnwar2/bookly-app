import 'package:bookly_app/core/utils/app_style.dart';
import 'package:bookly_app/core/utils/shared/book_rating.dart';
import 'package:bookly_app/features/search/domain/entities/search_book_entities.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
            child: Row(
              children: [
                SizedBox(
                  height: 125,
                  child: Hero(
                    tag: books[index].bookId,
                    child: AspectRatio(
                      aspectRatio: 2.5 / 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: books[index].image ?? "",
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(books[index].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.styleRegular20(context)
                                .copyWith(height: 1.2)),
                        const SizedBox(height: 3),
                        Text(books[index].authorName ?? "",
                            style: AppStyles.styleRegular20(context).copyWith(
                                color: Colors.white.withOpacity(0.8))),
                        const SizedBox(height: 3),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Free'),
                              BookRating(
                                  ratingStar: books[index].rating ?? 0,
                                  ratingNumber: books[index].ratingCount ?? 0),
                            ])
                      ]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
