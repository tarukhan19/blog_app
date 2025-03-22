import 'package:blog_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class UserSignIn implements UseCase<String, UserSignInParameters> {
  final AuthRepository authRepository;

  UserSignIn(this.authRepository);

  @override
  Future<Either<Failure, String>> call(UserSignInParameters params) async {
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
