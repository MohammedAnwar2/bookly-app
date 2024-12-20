import 'dart:async';
import 'package:bookly_app/core/utils/app_style.dart';
import 'package:bookly_app/core/utils/functions/debouncer.dart';
import 'package:bookly_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/manager/text_input_cubit/text_input_cubit.dart';
import 'package:bookly_app/features/search/presentation/widgets/another_items_search_list_view_bloc_builder.dart';
import 'package:bookly_app/features/search/presentation/widgets/custom_text_form_field.dart';
import 'package:bookly_app/features/search/presentation/widgets/search_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});
  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late Debouncer debouncer;
  @override
  void initState() {
    debouncer = Debouncer(milliseconds: 200);
    super.initState();
  }

  @override
  void dispose() {
    debouncer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();
    final textInputCubit = context.read<TextInputCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocSelector<TextInputCubit, TextInputState, bool>(
            selector: (state) => state is TextInputTyping,
            builder: (context, isTyping) {
              return CustomTextFormField(
                controller: textInputCubit.controller,
                suffixIcon: IconButton(
                  onPressed: () {
                    if (isTyping) {
                      textInputCubit.clearInput();
                    }
                  },
                  icon: Icon(
                    isTyping
                        ? FontAwesomeIcons.xmark
                        : FontAwesomeIcons.magnifyingGlass,
                    size: 22,
                  ),
                ),
                onChanged: (text) {
                  textInputCubit.onTyping(text);
                  if (text.isNotEmpty) {
                    debouncer.run(() {
                      searchCubit.fetchSpecificsBooks(title: text);
                    });
                  }
                },
              );
            },
          ),
          SizedBox(height: 10),
          BlocSelector<TextInputCubit, TextInputState, bool>(
            selector: (state) => state is TextInputTyping,
            builder: (context, isTyping) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isTyping ? "Result Search" : "Another Books",
                    style: AppStyles.styleSemiBolde18(context),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: isTyping
                        ? SearchListViewBlocConsumer()
                        : AnotherItemSearchListViewBlocBuilder(),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
