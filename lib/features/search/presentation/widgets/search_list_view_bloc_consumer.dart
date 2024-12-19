import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/widgets/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListViewBlocConsumer extends StatefulWidget {
  const SearchListViewBlocConsumer({
    super.key,
  });

  @override
  State<SearchListViewBlocConsumer> createState() =>
      _SearchListViewBlocConsumerState();
}

class _SearchListViewBlocConsumerState
    extends State<SearchListViewBlocConsumer> {
  late List<BookEntity> books;
  @override
  void initState() {
    books = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is SearchSuccess) {
          return SearchListView(books: state.books);
        } else if (state is SearchFailure) {
          return Center(
              child: Text(state.errorMessage, textAlign: TextAlign.center));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
