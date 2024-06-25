import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_app/core/exceptions/base_exception.dart';
import 'package:task_app/core/utils/snackbar_utils.dart';
import 'package:task_app/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:task_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:task_app/features/authentication/domain/usecase/signin_usecase.dart';
import 'package:task_app/features/authentication/domain/usecase/signup_usecase.dart';
part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final AuthRepository repository;

  @override
  void build(BuildContext context) {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    repository = ref.read(authRepositoryProvider);
  }

  Future<void> signUpWithEmail(String email, String password) async {
    try {
      await SignUpUsecase(repository: repository)(email, password);
    } on BaseException catch (e) {
      Future.sync(
        () => SnackbarUtils.showMessage(context, e.message),
      );
    }
  }

  Future<void> SignInWithEmail(String email, String password) async {
    try {
      await SignInUsecase(repository: repository)(email, password);
    } on BaseException catch (e) {
      Future.sync(
        () => SnackbarUtils.showMessage(context, e.message),
      );
    }
  }
}
