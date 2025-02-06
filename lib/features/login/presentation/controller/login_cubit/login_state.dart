import 'package:flutter/material.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/features/login/data/models/login_model.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginModel loginModel;

  LoginSuccess({required this.loginModel});
}

final class LoginError extends LoginState {
  final Failure failure;

  LoginError({required this.failure});
}
