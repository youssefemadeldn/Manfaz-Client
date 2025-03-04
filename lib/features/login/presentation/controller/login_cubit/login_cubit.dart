import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/core/cache/shared_pref_utils.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/features/login/domain/use_cases/login_use_case.dart';
import 'package:manfaz/features/login/presentation/controller/login_cubit/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  bool isPasswordVisible = true;
  var emailController =
      TextEditingController(text: 'youssefemad63.ye@gmail.com');
  var passwordController = TextEditingController(text: '01154516292');
  String userType = '';
  bool? isUserVerified = false;
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());

  emitLoginState() async {
    emit(LoginLoading());
    isUserVerified = await SharedPrefUtils.getData('isUserVerified');
    if (isUserVerified ?? false) {
      var either = await loginUseCase.call(
        email: emailController.text,
        password: passwordController.text,
        role: userType,
      );

      either.fold(
        (failure) => emit(LoginError(failure: failure)),
        (loginModel) => emit(LoginSuccess(loginModel: loginModel)),
      );
      return;
    }
    emit(LoginOTPNotVerifiedError(
      failure: Failure(
        failureTitle: 'Error',
        errorMessage: 'Please verify your account first',
      ),
    ));
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
