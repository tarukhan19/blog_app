import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data.dart';
import 'package:blog_app/features/auth/domain/entity/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteData authRemoteData;

  const AuthRepositoryImpl(this.authRemoteData);

  @override
  Future<Either<Failure, User>> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await (authRemoteData.signInWithEmailPassword(
        emailId: email,
        password: password,
      ));
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await (authRemoteData.signUpWithEmailPassword(
        name: name,
        emailId: email,
        password: password,
      ));
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
