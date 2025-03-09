part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final RegisterModel registerModel;
  RegisterSuccess({required this.registerModel});
}

final class RegisterError extends RegisterState {
 final Failure failure;
  RegisterError({required this.failure});
}
