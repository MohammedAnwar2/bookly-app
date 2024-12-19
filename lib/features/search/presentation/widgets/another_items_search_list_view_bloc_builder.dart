import 'package:bookly_app/features/search/presentation/manager/all_books_cubit/all_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/widgets/search_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'another_items_search_list_view.dart';

class AnotherItemSearchListViewBlocBuilder extends StatelessWidget {
  const AnotherItemSearchListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllBooksCubit, AllBooksState>(
      builder: (context, state) {
        if (state is AllBooksSuccess ||
            state is AllBooksPaginationFailure ||
            state is AllBooksPaginationLoading) {
          return AnotherItemSearchListView(
              books: context.read<GetAllBooksCubit>().booksLit);
        } else if (state is AllBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return SearchListViewLoadingIndicator();
        }
      },
    );
  }
}
