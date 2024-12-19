import 'package:bookly_app/core/class/either_class.dart';
import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/core/error/error.dart';
import 'package:bookly_app/core/use_case/use_cases.dart';
import 'package:bookly_app/features/search/domain/repositories/search_repo.dart';

class FetchSpecificBooksUseCase extends UseCase<List<BookEntity>, String> {
  final SearchRepo searchRepo;
  FetchSpecificBooksUseCase({required this.searchRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> call([String param = '']) async {
    return await searchRepo.fetchSpecificBooks(title: param);
  }
}
