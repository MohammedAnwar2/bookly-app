import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_book_cubit/newest_book_cubit.dart';
import 'package:bookly_app/features/home/presentation/widgets/best_seller_list_view.dart';
import 'package:bookly_app/features/home/presentation/widgets/best_seller_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListViewBlocBuilder extends StatefulWidget {
  const BestSellerListViewBlocBuilder({
    super.key,
  });

  @override
  State<BestSellerListViewBlocBuilder> createState() =>
      _BestSellerListViewBlocBuilderState();
}

class _BestSellerListViewBlocBuilderState
    extends State<BestSellerListViewBlocBuilder> {
  final List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBookCubit, NewestBookState>(
      listener: (context, state) {
        if (state is NewestBookSuccess) {
          books.addAll(state.booksList);
        }
      },
      builder: (context, state) {
        if (state is NewestBookSuccess ||
            state is NewestBookPaginationFailure ||
            state is NewestBookPaginationLoading) {
          return BestSellerListView(books: books);
        } else if (state is NewestBookFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return BestSellerListViewLoadingIndicator();
        }
      },
    );
  }
}
