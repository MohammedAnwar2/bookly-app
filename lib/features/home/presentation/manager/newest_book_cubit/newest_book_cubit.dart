import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_case.dart/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';
part 'newest_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  NewestBookCubit(this.fetchNewestBooksUseCase) : super(NewestBookInitial());

  Future<void> etchNewestBooks() async {
    emit(NewestBookLoading());
    var response = await fetchNewestBooksUseCase.call();
    response.fold((failure) {
      emit(NewestBookFailure(failure.message));
    }, (books) {
      emit(NewestBookSuccess(books));
    });
  }
}
