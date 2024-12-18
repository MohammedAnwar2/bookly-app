import 'package:bookly_app/features/home/presentation/widgets/best_seller_list_view.dart';
import 'package:bookly_app/features/home/presentation/widgets/best_seller_list_view_bloc_builder.dart';
import 'package:bookly_app/features/home/presentation/widgets/best_seller_title.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/widgets/featured_book_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeaturedBookListViewBlocConsumer(),
              SizedBox(height: 50),
              BestSellerTextTile(),
            ],
          ),
        ),
        BestSellerListViewBlocBuilder(),
        SliverToBoxAdapter(child: SizedBox(height: 30)),
      ],
    );
  }
}
