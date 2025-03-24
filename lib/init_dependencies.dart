import 'package:blog_app/features/auth/data/datasources/auth_remote_data.dart';
import 'package:blog_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_in.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/secrets/supabase_secrets.dart';

/*
GetIt is a service locator package in Dart/Flutter.
It allows to register dependencies and retrieve them anywhere in the app without manually passing instances.

creates a singleton instance of GetIt that will manage all dependencies.
registerLazySingleton => instance is created only when it is first needed and then reused for the entire app lifecycle.
registerFactory => It is a method in the get_it package that creates a new instance every time you request it.

=> A fat arrow (=>) is used to define a single expression in a function.
This is a cleaner way to write functions with a single statement.

.. -> cascade operator(..) in Dart allows you to perform multiple operations on the same object
 without repeating its name.

 A Service Locator is a design pattern used to manage dependencies efficiently.
 In Flutter, we commonly use GetIt as a Service Locator to register and access
 dependencies without passing them manually through constructors.
 */
final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supaBase = await Supabase.initialize(
    url: AppSecrets.SUPA_BASE_URL,
    anonKey: AppSecrets.SUPA_BASE_ANNON_KEY,
  );
  serviceLocator.registerLazySingleton(() => supaBase.client);
}

void _initAuth() {
  // data source
  serviceLocator
    ..registerFactory<AuthRemoteData>(
      () => AuthRemoteDataImpl(serviceLocator()),
    )
    // repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()),
    )
    // useCases
    ..registerFactory(() => UserSignUp(serviceLocator()))
    ..registerFactory(() => UserSignIn(serviceLocator()))
    // bloc
    ..registerLazySingleton(() => AuthBloc(serviceLocator(), serviceLocator()));
}
