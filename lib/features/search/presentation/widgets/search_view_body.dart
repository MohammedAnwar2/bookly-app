import 'package:bookly_app/core/utils/app_style.dart';
import 'package:bookly_app/features/search/presentation/widgets/another_items_search_list_view_bloc_consumer.dart';
import 'package:bookly_app/features/search/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            onChanged: (text) {},
          ),
          SizedBox(height: 10),
          Text("Another Books", style: AppStyles.styleSemiBolde18(context)),
          SizedBox(height: 20),
          Expanded(
            child: AnotherItemSearchListViewBlocConsumer(),
          )
        ],
      ),
    );
  }
}
