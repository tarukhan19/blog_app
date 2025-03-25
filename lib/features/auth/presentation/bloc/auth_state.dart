part of 'auth_bloc.dart';

/*
AuthState class represents different authentication states in the BLoC pattern.
It is a sealed class (using sealed keyword),
which means all possible states must be defined within the same file.

🛠 Breakdown of Each State
1️⃣ AuthInitial → Default state when authentication hasn’t started.
2️⃣ AuthLoading → Indicates an authentication request (sign-in/sign-up) is in progress.
3️⃣ AuthSuccess → Represents a successful authentication with a User object.
4️⃣ AuthFailure → Represents an authentication failure with an error message.
 */
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final User user;
  const AuthSuccess(this.user);

}

final class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);
}
