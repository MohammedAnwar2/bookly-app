import 'package:bookly_app/core/utils/app_style.dart';
import 'package:bookly_app/features/search/presentation/widgets/another_items_search_list_view_bloc_consumer.dart';
import 'package:bookly_app/features/search/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late TextEditingController textController;
  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            textController: textController,
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
