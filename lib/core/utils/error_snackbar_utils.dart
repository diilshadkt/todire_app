import 'package:flutter/material.dart';

class ErrorSnackbarUtils {
  static showError(BuildContext context, String? error) async {
    if (error != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error)));
    }
  }
}
