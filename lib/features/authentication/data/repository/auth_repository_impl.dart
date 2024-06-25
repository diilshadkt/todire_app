import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_app/features/authentication/data/datasource/auth_firebase_datasource.dart';
import 'package:task_app/features/authentication/data/datasource/auth_firebase_datasource_impl.dart';
import 'package:task_app/features/authentication/domain/repository/auth_repository.dart';
part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseDatasource datasource;
  AuthRepositoryImpl({required this.datasource});

  @override
  Future<UserCredential> signUpWithEmail(String email, String password) async {
    return await datasource.signUpWithEmail(email, password);
  }

  @override
  Future<UserCredential> signInWithEmail(String email, String password) async {
    return await datasource.signInWithEmail(email, password);
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
      datasource: ref.watch(authFirebaseDatasourceProvider));
}
