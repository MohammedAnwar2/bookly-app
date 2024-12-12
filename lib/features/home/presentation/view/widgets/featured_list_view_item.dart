import 'package:flutter/material.dart';

class FeaturedBookListViewItem extends StatelessWidget {
  const FeaturedBookListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://imageio.forbes.com/specials-images/imageserve/5f85be4ed0acaafe77436710/0x0.jpg?format=jpg&height=900&width=1600&fit=bounds'))),
      ),
    );
  }
}
