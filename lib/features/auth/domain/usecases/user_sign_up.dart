import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<String, UserSignUpParameters> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, String>> call(UserSignUpParameters params) async {
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
