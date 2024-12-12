import 'package:bookly_app/features/home/presentation/view/widgets/custom_aoo_bar.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/featured_book_list_view_item.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          FeaturedBookListViewItem(),
        ],
      ),
    );
  }
}
