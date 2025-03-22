import 'package:blog_app/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteData {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String emailId,
    required String password,
  });

  Future<String> signInWithEmailPassword({
    required String emailId,
    required String password,
  });
}

class AuthRemoteDataImpl implements AuthRemoteData {
  final SupabaseClient supaBaseClient;

  AuthRemoteDataImpl(this.supaBaseClient);

  @override
  Future<String> signInWithEmailPassword({
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
        return response.user!.id;
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> signUpWithEmailPassword({
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
        return response.user!.id;
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
