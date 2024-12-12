import 'package:bookly_app/features/home/presentation/view/widgets/best_seller_list_view.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/best_seller_title.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        FeaturedBookListView(),
        SizedBox(height: 50),
        BestSellerTextTile(),
        Expanded(child: const BestSellerListView())
      ],
    );
  }
}
