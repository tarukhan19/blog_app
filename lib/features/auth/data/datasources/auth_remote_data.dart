import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/features/auth/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/*
Data Sources → Handles API calls, local DB interactions.

Defines the contract for interacting with Supabase.

AuthRemoteDataImpl implements this interface and interacts directly with Supabase.
✅ Why use an interface?

It allows easy swapping of Supabase with another backend (e.g., Firebase, REST API)
 without modifying business logic.

an abstract interface class is a combination of both an abstract class and an interface.
It allows defining a contract with method signatures (like an interface) while also supporting optional
method implementations
 */
abstract interface class AuthRemoteData {
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String emailId,
    required String password,
  });

  Future<UserModel> signInWithEmailPassword({
    required String emailId,
    required String password,
  });
}

class AuthRemoteDataImpl implements AuthRemoteData {
  final SupabaseClient supaBaseClient;

  AuthRemoteDataImpl(this.supaBaseClient);

  @override
  Future<UserModel> signInWithEmailPassword({
    required String emailId,
    required String password,
  }) async {
    try {
      final response = await supaBaseClient.auth.signInWithPassword(
        password: password,
        email: emailId,
      );
      if (response.user == null) {
        throw const ServerException("User is null");
      } else {
        return UserModel.fromJson(response.user!.toJson());
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String emailId,
    required String password,
  }) async {
    try {
      final response = await supaBaseClient.auth.signUp(
        password: password,
        email: emailId,
        data: {'name': name},
      );
      if (response.user == null) {
        throw const ServerException("User is null");
      } else {
        return UserModel.fromJson(response.user!.toJson());
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
