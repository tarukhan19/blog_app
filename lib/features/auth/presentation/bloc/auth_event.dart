part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignUp extends AuthEvent {
  final String name;
  final String emailId;
  final String password;

  AuthSignUp({
    required this.name,
    required this.emailId,
    required this.password,
  });
}

final class AuthSignIn extends AuthEvent {
  final String emailId;
  final String password;

  AuthSignIn({
    required this.emailId,
    required this.password
  });
}
