import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_app/core/exceptions/auth/auth_failed_exception.dart';
import 'package:task_app/features/authentication/data/datasource/auth_firebase_datasource.dart';
part 'auth_firebase_datasource_impl.g.dart';

class AuthFirebaseDatasourceImpl implements AuthFirebaseDatasource {
  final FirebaseAuth auth;
  AuthFirebaseDatasourceImpl(this.auth);
  @override
  Future<UserCredential> signInWithEmail(String email, String password) async {
    try {
      return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthFailedException("This password provided is too week");
      } else if (e.code == 'email-already-in-use') {
        throw AuthFailedException('The account already exists for this email.');
      } else {
        throw AuthFailedException('Cannot signup. Please try again');
      }
    }
  }

  @override
  Future<UserCredential> signUpWithEmail(String email, String password) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthFailedException('Wrong email address');
      } else if (e.code == 'wrong-password') {
        throw AuthFailedException('wrong password');
      } else if (e.code == 'user-disabled') {
        throw AuthFailedException('User is disabled. Cannot login');
      } else {
        throw AuthFailedException('Cannot login. Please try again');
      }
    }
  }
}
@riverpod
AuthFirebaseDatasource authFirebaseDatasource(AuthFirebaseDatasourceRef ref) {
  return AuthFirebaseDatasourceImpl(FirebaseAuth.instance);
}
