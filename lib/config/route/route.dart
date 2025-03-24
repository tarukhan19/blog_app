import 'package:blog_app/config/route/route_constant.dart';
import 'package:blog_app/features/auth/presentation/screens/screen_signup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/screens/screen_signin.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        name: RouteConstant.signIn,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SignInScreen());
        },
      ),
      GoRoute(
        name: RouteConstant.signUp,
        path: '/signup',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SignupScreen());
        },
      ),
    ],
  );

  static GoRouter get router => _router;
}
