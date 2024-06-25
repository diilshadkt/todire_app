import 'package:task_app/core/exceptions/base_exception.dart';

class InvalidException extends BaseException {
  InvalidException() : super("Invalid user input");
}
