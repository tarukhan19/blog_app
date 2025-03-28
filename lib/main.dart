import 'package:blog_app/config/route/route.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/features/auth/presentation/screens/screen_signin.dart';
import 'package:blog_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theme/theme.dart';

/*
  The function WidgetsFlutterBinding.ensureInitialized(); is an important part of the Flutter initialization process,
   ensuring that the Flutter framework is properly set up before executing any further code.

   MultiBlocProvider helps manage multiple BLoCs efficiently.
   Ensures a single instance of BLoC is used inside the tree.

   when a function parameter is required but we don’t need to use it, we can replace it with (_)
   create: (_) => serviceLocator<AuthBloc>()
   This is a function that takes a parameter (context) but does not use it.

   BlocProvider(create: (_) => serviceLocator<AuthBloc>())
   Creates an instance of AuthBloc using serviceLocator.
   serviceLocator<AuthBloc>() fetches the AuthBloc instance from get_it.
   */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(
    MultiBlocProvider(
        providers: [BlocProvider(create: (_) => serviceLocator<AuthBloc>()),],
        child:  MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: "Blogs",
          theme: AppTheme.darkThemeMode,
          routeInformationProvider: AppRouter.router.routeInformationProvider,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routerDelegate: AppRouter.router.routerDelegate,
        ),
    ),
  );
}
