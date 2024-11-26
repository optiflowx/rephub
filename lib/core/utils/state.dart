import 'package:either_dart/either.dart';

class Failure {
  const Failure({
    this.message,
    this.exception,
    this.stackTrace,
  });

  final String? message;
  final Exception? exception;
  final StackTrace? stackTrace;
}

class Success<T> {
  const Success({
    this.message,
    this.data,
  });

  final String? message;
  final T? data;
}

typedef StateOr<T> = Either<Failure, Success<T>>;
typedef FutureEither<T> = Future<StateOr<T>>;
