import 'package:bookly_app/core/utils/shared/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class ListViewItemsLoadingIndicator extends StatelessWidget {
  const ListViewItemsLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: Row(
        children: [
          SizedBox(
            height: 125,
            child: AspectRatio(
              aspectRatio: 2.5 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 16,
                  width: 100,
                  color: Colors.grey,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 16,
                      width: 50,
                      color: Colors.grey,
                    ),
                    Container(
                      height: 16,
                      width: 80,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
