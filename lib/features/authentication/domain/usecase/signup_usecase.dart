import 'package:task_app/core/exceptions/auth/auth_failed_exception.dart';
import 'package:task_app/core/exceptions/auth/invalid_exception.dart';
import 'package:task_app/features/authentication/domain/repository/auth_repository.dart';

class SignUpUsecase {
  final AuthRepository repository;
  SignUpUsecase({required this.repository});

  Future<void> call(String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidException();
    }
    try {
      await repository.signUpWithEmail(email, password);
    } on Exception {
      throw AuthFailedException('Cannot signup. Please try again.');
    }
  }
}
