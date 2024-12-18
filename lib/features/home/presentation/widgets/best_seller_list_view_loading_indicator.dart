import 'package:bookly_app/features/home/presentation/widgets/best_seller_list_view_items_loading_indicator.dart';
import 'package:flutter/material.dart';

class BestSellerListViewLoadingIndicator extends StatelessWidget {
  const BestSellerListViewLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 50,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 16),
          child: BestSellerListViewItemsLoadingIndicator(),
        );
      },
    );
  }
}
