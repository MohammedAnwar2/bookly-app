import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/widgets/best_seller_list_view_items.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: books.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 16),
          child: BestSellerListViewItem(books: books[index]),
        );
      },
    );
  }
}

// class BestSellerListView extends StatelessWidget {
//   const BestSellerListView({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: List.generate(
//         50,
//         (index) => const Padding(
//           padding: EdgeInsets.only(bottom: 16),
//           child: BestSellerListViewItem(),
//         ),
//       ),
//     );
//   }
// }

// class BestSellerListView extends StatelessWidget {
//   const BestSellerListView({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       padding: EdgeInsets.zero,
//       itemCount: 50,
//       itemBuilder: (BuildContext context, int index) {
//         return const Padding(
//           padding: EdgeInsets.only(bottom: 16),
//           child: BestSellerListViewItem(),
//         );
//       },
//     );
//   }
// }
