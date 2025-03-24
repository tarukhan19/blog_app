import 'package:blog_app/features/auth/domain/usecases/user_sign_in.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/user.dart';

part 'auth_event.dart';

part 'auth_state.dart';

/*
AuthBloc is the central part of your authentication system using BLoC (Business Logic Component).
It listens to authentication events (AuthEvent) and updates the UI based on authentication states (AuthState).

✅ UserSignUp & UserSignIn are injected into the bloc.
✅ super(AuthInitial()) → Sets the initial state as AuthInitial().

✅ on<AuthEvent>((_, emit) => emit(AuthLoading()));

Ensures that any authentication event first emits AuthLoading().
✅ on<AuthSignUp>(_onAuthSignUp);
In Flutter BLoC, on<T>() is a method used to register event handlers inside a BLoC class.
Calls _onAuthSignUp when the AuthSignUp event is triggered.
✅ on<AuthSignIn>(_onAuthSignIn);

Calls _onAuthSignIn when the AuthSignIn event is triggered.

✅ Calls _userSignUp use case with user details (name, email, password).
✅ Uses fold() to handle success or failure:

Failure: Emits AuthFailure(onFailure.message).

Success: Emits AuthSuccess(user)

🔥 How It Works in the Authentication Flow
1️⃣ User clicks "Sign Up" or "Sign In" → AuthEvent is triggered.
2️⃣ Bloc listens to the event → Calls the respective handler (_onAuthSignUp or _onAuthSignIn).
3️⃣ State is updated →

If authentication fails → AuthFailure state is emitted.

If authentication succeeds → AuthSuccess state is emitted.
4️⃣ UI reacts to the state change → Displays loading, success, or error message.

 */
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;

  AuthBloc(this._userSignUp, this._userSignIn) : super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthSignIn>(_onAuthSignIn);
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    final signUpResponse = await _userSignUp(
      UserSignUpParameters(
        emailId: event.emailId,
        password: event.password,
        name: event.name,
      ),
    );
    /*
     fold is a method used in functional programming to handle Either types (from the dart package).
     It allows you to process both success and failure cases in a single operation, making error handling clean and concise.
     */
    signUpResponse.fold(
      (onFailure) => emit(AuthFailure(onFailure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  void _onAuthSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    final signInResponse = await _userSignIn(
      UserSignInParameters(emailId: event.emailId, password: event.password),
    );

    signInResponse.fold(
      (onFailure) => emit(AuthFailure(onFailure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }
}
