import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/widgets/books_details_section.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_home_view_details_app_bar.dart';
import 'package:flutter/material.dart';

import 'similar_books_section.dart';

class HomeViewDetailsBody extends StatelessWidget {
  const HomeViewDetailsBody({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: CustomScrollView(
            slivers: [
              // AppBar أو أي عنصر رئيسي
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomHomeViewDetailsAppBar(),
                    SizedBox(height: 30),
                    BooksDetailsSection(book: book),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    SimilarBooksSection(),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class HomeViewDetailsBody extends StatelessWidget {
//   const HomeViewDetailsBody({super.key, required this.book});
//   final BookEntity book;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 30),
//           child: Column(
//             children: [
//               CustomHomeViewDetailsAppBar(),
//               SizedBox(height: 30),
//               BooksDetailsSection(book: book),
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(), // يملأ الفجوة
//                     SimilarBooksSection(),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 24),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HomeViewDetailsBody extends StatelessWidget {
//   const HomeViewDetailsBody({super.key, required this.book});
//   final BookEntity book;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 30),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 CustomHomeViewDetailsAppBar(),
//                 SizedBox(height: 30),
//                 BooksDetailsSection(book: book),
//                 // Expanded(child: SizedBox(height: 30)),
//                 // SizedBox(height: 30),
//                 // Spacer(),
//                 SimilarBooksSection(),
//                 // Expanded(child: SimilarBooksSection()),
//                 SizedBox(height: 24),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// // class HomeViewDetailsBody extends StatelessWidget {
//   const HomeViewDetailsBody({super.key, required this.book});
//   final BookEntity book;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: [
//             SliverFillRemaining(
//               hasScrollBody: false,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 30),
//                 child: Column(
//                   children: [
//                     CustomHomeViewDetailsAppBar(),
//                     SizedBox(height: 30),
//                     BooksDetailsSection(book: book),
//                     Expanded(child: SizedBox(height: 30)),
//                     SimilarBooksSection(),
//                     SizedBox(height: 24),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
