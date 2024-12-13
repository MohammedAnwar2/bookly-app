import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/app_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'book_rating.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({
    super.key,
  });

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
                  imageUrl:
                      "https://t4.ftcdn.net/jpg/00/05/86/25/240_F_5862533_wQ6IJRVm6vLtub3aqirHc0AsUK3EfloS.jpg",
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
              Text("Harry Potter and the Goblet of Fire",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      AppStyles.styleRegular20(context).copyWith(height: 1.2)),
              const SizedBox(height: 3),
              Text("J.K Rowing",
                  style: AppStyles.styleRegular20(context)
                      .copyWith(color: Colors.white.withOpacity(0.8))),
              const SizedBox(height: 3),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("19.99\$"),
                    BookRating(),
                  ])
            ]),
          ),
        ],
      ),
    );
  }
}
