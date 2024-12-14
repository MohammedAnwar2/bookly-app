import 'package:bookly_app/core/class/either_class.dart';
import 'package:bookly_app/core/error/error.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}

class NoParam {}
