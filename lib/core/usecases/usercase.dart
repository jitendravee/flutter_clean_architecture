import 'package:clean_architecture/core/error/Failure_error.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Usercase<SuccessType, Params> {
  Future<Either<FailureError, SuccessType>> call(Params params);
}

class NoParams {}
