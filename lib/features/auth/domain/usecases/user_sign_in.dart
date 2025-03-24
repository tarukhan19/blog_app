import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/features/auth/domain/entity/user.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

/*
Use Cases → Contains business logic (e.g., LoginUserUseCase, SignupUsecase).

📌 Purpose: Defines business logic for authentication.

Each use case:

Takes parameters as input.
Calls the repository interface to fetch/process data.
Returns an either success (User) or failure.
 */
class UserSignIn implements UseCase<User, UserSignInParameters> {
  final AuthRepository authRepository;
  UserSignIn(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignInParameters params) async {
    return await authRepository.signInWithEmailPassword(
      email: params.emailId,
      password: params.password,
    );
  }
}

class UserSignInParameters {
  final String emailId;
  final String password;

  UserSignInParameters({required this.emailId, required this.password});

}
