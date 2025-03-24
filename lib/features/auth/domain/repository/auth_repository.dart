import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/features/auth/domain/entity/user.dart';
import 'package:fpdart/fpdart.dart';

/*
Repositories (Abstract) → Interfaces defining data access methods.

The Data Layer will implement this, but the Domain Layer doesn’t care how it is implemented (Supabase, Firebase, API, etc.).

This allows switching databases without affecting business logic.

Either<Failure, User> → Uses functional programming to return either a success (User) or a failure.

 */
abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signInWithEmailPassword({
    required String email,
    required String password,
  });
}
