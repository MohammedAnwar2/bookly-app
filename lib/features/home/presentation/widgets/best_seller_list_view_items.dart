import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/app_style.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'book_rating.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({
    super.key,
    required this.books,
  });
  final BookEntity books;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.homeViewDetails);
      },
      child: Row(
        children: [
          SizedBox(
            height: 125,
            child: AspectRatio(
              aspectRatio: 2.5 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: books.image ?? "",
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(books.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      AppStyles.styleRegular20(context).copyWith(height: 1.2)),
              const SizedBox(height: 3),
              Text(books.authorName ?? "",
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
      ),
    );
  }
}
