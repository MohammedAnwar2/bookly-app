import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:meta/meta.dart';
part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  final HomeRepoImp homeRepoImp;
  FeaturedBookCubit(this.homeRepoImp) : super(FeaturedBookInitial());

  fetchFeaturedBooks() async {
    emit(FeaturedBookLoading());
    var response = await homeRepoImp.fetchFeaturedBooks();
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
