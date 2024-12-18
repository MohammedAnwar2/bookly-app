import 'package:bookly_app/core/class/either_class.dart';
import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/core/error/error.dart';
import 'package:bookly_app/core/use_case/use_cases.dart';
import 'package:bookly_app/features/search/domain/repositories/search_repo.dart';

class FetchAllBooksUseCase extends UseCase<List<BookEntity>, int> {
  final SearchRepo searchRepo;
  FetchAllBooksUseCase({required this.searchRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) async {
    return await searchRepo.fetchAllBooks(pageNumber: param);
  }
}
