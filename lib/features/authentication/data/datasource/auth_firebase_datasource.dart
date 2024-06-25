

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseDatasource {
  Future<UserCredential> signUpWithEmail(
    final String email,
    final String password,
  );

  Future<UserCredential> signInWithEmail(
    final String email,
    final String password,
  );
  
}
