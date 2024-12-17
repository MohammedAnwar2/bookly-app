import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:bookly_app/features/home/presentation/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookListViewBlocBuilder extends StatefulWidget {
  const FeaturedBookListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeaturedBookListViewBlocBuilder> createState() =>
      _FeaturedBookListViewBlocBuilderState();
}

class _FeaturedBookListViewBlocBuilderState
    extends State<FeaturedBookListViewBlocBuilder> {
  final List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBookCubit, FeaturedBookState>(
      listener: (context, state) {
        if (state is FeaturedBookSuccess) {
          books.addAll(state.bookList);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBookSuccess ||
            state is FeaturedBookPaginationLoading) {
          return FeaturedBookListView(books: books);
        } else if (state is FeaturedBookFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
