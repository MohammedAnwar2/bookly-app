import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/widgets/home_view_details_body.dart';
import 'package:flutter/material.dart';

class HomeViewDetails extends StatelessWidget {
  const HomeViewDetails({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return HomeViewDetailsBody(book: book);
  }
}
