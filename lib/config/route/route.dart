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
      // GoRoute(
      //   name: RouteConstant.home,
      //   path: '/home/:id',
      //   pageBuilder: (context, state) {
      //     return MaterialPage(child: HomeScreen(id: state.params[!'id']));
      //   },
      // ),
    ],
    // redirect: (context, state) async {
    //   bool isAuthenticated = true;
    //   if (isAuthenticated && state.matchedLocation == '/') {
    //     return state.namedLocation(RouteConstant.signIn);
    //   }
    //   return null;
    // },
  );

  static GoRouter get router => _router;
}
