import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl, required this.id});
  final String imageUrl;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300),
        child: AspectRatio(
          aspectRatio: 2.7 / 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: imageUrl,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
