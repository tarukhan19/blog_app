part of 'auth_bloc.dart';
/*
AuthEvent class represents different authentication-related user actions (events) in the BLoC
 pattern. Events define what triggers the authentication process, such as signing up or logging in.

🛠 Breakdown of AuthEvent
1️⃣ AuthSignUp → Triggered when a user signs up with name, email, and password.
2️⃣ AuthSignIn → Triggered when a user logs in with email and password.

✅ A sealed class is a special type of class that restricts inheritance to only within the same file.
  These classes cannot be instantiated because they are meant to be extended only.
 */
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
