import 'package:bookly_app/core/utils/shared/custom_book_image_loading_indicator.dart';
import 'package:bookly_app/core/utils/shared/custom_fading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage(
      {super.key,
      required this.imageUrl,
      required this.id,
      this.aspectRatio = 2.7 / 4});
  final String imageUrl;
  final String id;
  final double aspectRatio;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: imageUrl,
              placeholder: (context, url) => CustomFadingWidget(
                  child: const CustomBookImageLoadingIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
