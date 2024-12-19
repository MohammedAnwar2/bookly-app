import 'package:bookly_app/core/utils/app_style.dart';
import 'package:bookly_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/widgets/another_items_search_list_view_bloc_builder.dart';
import 'package:bookly_app/features/search/presentation/widgets/custom_text_form_field.dart';
import 'package:bookly_app/features/search/presentation/widgets/search_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SearchCubit, SearchState, bool>(
      selector: (state) {
        return context.read<SearchCubit>().isTyping;
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                onChanged: (text) {
                  context.read<SearchCubit>().onSearch(text);
                },
              ),
              SizedBox(height: 10),
              if (!state) ...{
                Text("Another Books",
                    style: AppStyles.styleSemiBolde18(context)),
                SizedBox(height: 20),
                Expanded(
                  child: AnotherItemSearchListViewBlocBuilder(),
                ),
              } else ...{
                Text("result search",
                    style: AppStyles.styleSemiBolde18(context)),
                SizedBox(height: 20),
                Expanded(
                  child: SearchListViewBlocConsumer(),
                )
              }
            ],
          ),
        );
      },
    );
  }
}