import 'package:blog_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

/*
call(Params params) → This method must be implemented in child classes.
It takes params (input parameters).
It performs some logic (e.g., fetching data, making an API call).
It returns either a failure or a successful result.

<SuccessType, Params> → This makes it a generic class, meaning:
SuccessType represents the type of successful result (e.g., a User object).
Params represents the input parameters needed for the operation (e.g.,LoginCredentials).
 */
abstract interface class UseCase<SuccessType, Params>{

  Future<Either<Failure,SuccessType >> call(Params params);
}