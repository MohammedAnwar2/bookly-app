import 'package:bookly_app/core/utils/shared/custom_fading_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/shared/custom_book_image_loading_indicator.dart';

class FeaturedBookListViewLoafingIndicator extends StatelessWidget {
  const FeaturedBookListViewLoafingIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * .3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsetsDirectional.only(
                start: index == 0 ? 24 : 12,
                end: index == 29 ? 24 : 0,
              ),
              child: CustomBookImageLoadingIndicator(),
            );
          },
        ),
      ),
    );
  }
}
