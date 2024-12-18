import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_case.dart/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';
part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  FeaturedBookCubit(this.featuredBooksUseCase) : super(FeaturedBookInitial());

  fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBookLoading());
    } else {
      emit(FeaturedBookPaginationLoading());
    }
    var response = await featuredBooksUseCase.call(pageNumber);
    response.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FeaturedBookFailure(failure.message));
        } else {
          emit(FeaturedBookPaginationFailure(failure.message));
        }
      },
      (bookList) {
        emit(FeaturedBookSuccess(bookList));
      },
    );
  }
}
