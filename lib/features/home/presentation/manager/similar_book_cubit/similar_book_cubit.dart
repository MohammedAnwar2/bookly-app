import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_case.dart/fetch_similar_books_use_case.dart';
import 'package:meta/meta.dart';

part 'similar_book_state.dart';

class SimilarBookCubit extends Cubit<SimilarBookState> {
  final FetchSimilardBooksUseCase fetchSimilardBooksUseCase;
  SimilarBookCubit(this.fetchSimilardBooksUseCase)
      : super(SimilarBookInitial()) {
    fetchSimilardBooks();
  }

  fetchSimilardBooks({int pageNumer = 0}) async {
    if (pageNumer == 0) {
      emit(SimilarBookLoading());
    } else {
      emit(SimilarBookPaginationLoading());
    }
    var books = await fetchSimilardBooksUseCase.call(pageNumer);
    books.fold(
      (failure) {
        if (pageNumer == 0) {
          emit(SimilarBookFailure(failure.message));
        } else {
          emit(SimilarBookPaginationFailure(failure.message));
        }
      },
      (listBooks) {
        emit(SimilarBookSuccess(listBooks));
      },
    );
  }
}
