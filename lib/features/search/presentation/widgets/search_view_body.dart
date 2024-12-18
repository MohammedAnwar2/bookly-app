import 'package:bookly_app/features/search/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        children: [
          CustomTextFormField(),
        ],
      ),
    );
  }
}
