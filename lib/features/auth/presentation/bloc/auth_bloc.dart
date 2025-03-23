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
