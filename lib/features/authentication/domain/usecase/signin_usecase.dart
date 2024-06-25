import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_app/core/exceptions/auth/auth_failed_exception.dart';
import 'package:task_app/core/exceptions/auth/invalid_exception.dart';
import 'package:task_app/features/authentication/domain/repository/auth_repository.dart';

class SignInUsecase {
  final AuthRepository repository;
  SignInUsecase({required this.repository});

  Future<void> call(String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidException();
    }
    try {
      await repository.signInWithEmail(email, password);
    } on Exception{
      throw AuthFailedException('Cannot Login. Please try again.');
    }
  }
}
