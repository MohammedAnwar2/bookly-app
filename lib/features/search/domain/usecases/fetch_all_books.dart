import 'package:bookly_app/core/class/either_class.dart';
import 'package:bookly_app/core/error/error.dart';
import 'package:bookly_app/core/use_case/use_cases.dart';
import 'package:bookly_app/features/search/domain/entities/search_book_entities.dart';
import 'package:bookly_app/features/search/domain/repositories/search_repo.dart';

class FetchAllBooksUseCase extends UseCase<List<SearchBookEntities>, NoParam> {
  final SearchRepo searchRepo;
  FetchAllBooksUseCase(this.searchRepo);
  @override
  Future<Either<Failure, List<SearchBookEntities>>> call(
      [NoParam? param]) async {
    return await searchRepo.fetchAllBooks();
  }
}
