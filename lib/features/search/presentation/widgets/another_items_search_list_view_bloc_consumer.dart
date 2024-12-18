import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/features/search/domain/entities/search_book_entities.dart';
import 'package:bookly_app/features/search/presentation/manager/all_books_cubit/all_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'another_items_search_list_view.dart';

class AnotherItemSearchListViewBlocConsumer extends StatefulWidget {
  const AnotherItemSearchListViewBlocConsumer({
    super.key,
  });

  @override
  State<AnotherItemSearchListViewBlocConsumer> createState() =>
      _AnotherItemSearchListViewBlocConsumerState();
}

class _AnotherItemSearchListViewBlocConsumerState
    extends State<AnotherItemSearchListViewBlocConsumer> {
  late List<BookEntity> books;
  @override
  void initState() {
    books = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllBooksCubit, AllBooksState>(
      listener: (context, state) {
        if (state is AllBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is AllBooksSuccess ||
            state is AllBooksPaginationFailure ||
            state is AllBooksPaginationLoading) {
          return AnotherItemSearchListView(books: books);
        } else if (state is AllBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
