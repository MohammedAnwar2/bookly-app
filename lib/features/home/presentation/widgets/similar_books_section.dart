import 'package:bookly_app/core/utils/app_style.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_book_item.dart';
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
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsetsDirectional.only(start: 12),
                //! List.length -1 == index
                child: CustomBookImage(imageUrl: ""),
              );
            },
          ),
        ),
      ],
    );
  }
}
