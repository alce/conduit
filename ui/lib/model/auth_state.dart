import 'package:flutter/foundation.dart';

abstract class AuthState {
  const AuthState();
}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  const AuthError(this.message);

  final String message;
}

@immutable
class AuthValidationError extends AuthState {
  const AuthValidationError(this.fieldErrors);

  final Map<String, String> fieldErrors;
}
