import 'package:blog_app/features/auth/data/datasources/auth_remote_data.dart';
import 'package:blog_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_in.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/secrets/supabase_secrets.dart';

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
  serviceLocator.registerFactory<AuthRemoteData>(
    () => AuthRemoteDataImpl(serviceLocator()),
  );
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerFactory(() => UserSignUp(serviceLocator()));
  serviceLocator.registerFactory(() => UserSignIn(serviceLocator()));

  serviceLocator.registerLazySingleton(
    () =>
        AuthBloc(userSignUp: serviceLocator(), userSignedIn: serviceLocator()),
  );
}
