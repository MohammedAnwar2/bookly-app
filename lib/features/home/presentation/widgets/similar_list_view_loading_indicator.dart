import 'package:bookly_app/core/utils/shared/custom_fading_widget.dart';
import 'package:bookly_app/core/utils/shared/custom_book_image_loading_indicator.dart';
import 'package:flutter/material.dart';

class SimilarListViewLoadingIndicator extends StatelessWidget {
  const SimilarListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * .2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 12, end: 49 == index ? 24 : 0),
              child: CustomBookImageLoadingIndicator(),
            );
          },
        ),
      ),
    );
  }
}
