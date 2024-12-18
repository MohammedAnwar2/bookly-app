import 'package:bookly_app/features/search/presentation/manager/all_books_cubit/all_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'another_items_search_list_view.dart';

class AnotherItemSearchListViewBlocConsumer extends StatelessWidget {
  const AnotherItemSearchListViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllBooksCubit, AllBooksState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is AllBooksSuccess) {
          return AnotherItemSearchListView(books: state.books);
        } else if (state is AllBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
