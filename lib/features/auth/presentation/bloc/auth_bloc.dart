import 'package:blog_app/features/auth/domain/entity/user.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_in.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;

  AuthBloc({required UserSignUp userSignUp, required UserSignIn userSignedIn})
    : _userSignUp = userSignUp,
      _userSignIn = userSignedIn,
      super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      emit(AuthLoading());
      final signUpResponse = await _userSignUp(
        UserSignUpParameters(
          emailId: event.emailId,
          password: event.password,
          name: event.name,
        ),
      );

      final signInResponse = await _userSignIn(
        UserSignInParameters(emailId: event.emailId, password: event.password),
      );
      signUpResponse.fold(
        (onFailure) => emit(AuthFailure(onFailure.message)),
        (user) => emit(AuthSuccess(user)),
      );
      signInResponse.fold(
        (onFailure) => emit(AuthFailure(onFailure.message)),
        (user) => emit(AuthSuccess(user)),
      );
    });
  }
}
