import 'package:bookly_app/core/class/either_class.dart';
import 'package:bookly_app/core/error/error.dart';
import 'package:bookly_app/core/use_case/use_cases.dart';
import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repo/home_repo.dart';

class FetchSimilardBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchSimilardBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) async {
    // check permissions
    return await homeRepo.fetchSimilarBooks(pageNumer: param);
  }
}
