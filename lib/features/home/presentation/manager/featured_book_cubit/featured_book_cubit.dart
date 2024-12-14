import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_case.dart/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';
part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  FeaturedBookCubit(this.featuredBooksUseCase) : super(FeaturedBookInitial());

  fetchFeaturedBooks() async {
    emit(FeaturedBookLoading());
    var response = await featuredBooksUseCase.call();
    response.fold(
      (failure) {
        emit(FeaturedBookFailure(failure.message));
      },
      (bookList) {
        emit(FeaturedBookSuccess(bookList));
      },
    );
  }
}
