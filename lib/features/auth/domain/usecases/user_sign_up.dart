import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/entity/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

/*
Use Cases → Contains business logic (e.g., LoginUserUseCase, SignupUsecase).

📌 Purpose: Defines business logic for authentication.

Each use case:

Takes parameters as input.

Calls the repository interface to fetch/process data.

Returns an either success (User) or failure.
 */
class UserSignUp implements UseCase<User, UserSignUpParameters> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignUpParameters params) async {
    return await authRepository.signUpWithEmailPassword(
        name: params.name, email: params.emailId, password: params.password);
  }
}

class UserSignUpParameters {
  final String emailId;
  final String password;
  final String name;

  UserSignUpParameters({required this.emailId,required this.password,required this.name});
}
