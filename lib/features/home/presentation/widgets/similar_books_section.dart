import 'package:bookly_app/core/utils/app_style.dart';
import 'package:bookly_app/features/home/presentation/widgets/similar_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("You can also like", style: AppStyles.styleSemiBolde16(context)),
        const SizedBox(height: 12),
        SimilarListViewBlocConsumer(),
      ],
    );
  }
}
