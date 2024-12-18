import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_book_cubit/similar_book_cubit.dart';
import 'package:bookly_app/features/home/presentation/widgets/similar_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarListViewBlocConsumer extends StatefulWidget {
  const SimilarListViewBlocConsumer({
    super.key,
  });

  @override
  State<SimilarListViewBlocConsumer> createState() =>
      _SimilarListViewBlocConsumerState();
}

class _SimilarListViewBlocConsumerState
    extends State<SimilarListViewBlocConsumer> {
  late List<BookEntity> books;
  @override
  void initState() {
    books = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBookCubit, SimilarBookState>(
      listener: (context, state) {
        if (state is SimilarBookSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        switch (state) {
          case SimilarBookInitial():
          case SimilarBookPaginationLoading():
          case SimilarBookPaginationFailure():
          case SimilarBookSuccess():
            return SimilarListView(books: books);
          case SimilarBookFailure():
            return Center(child: Text(state.errorMessage));
          case SimilarBookLoading():
            return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
