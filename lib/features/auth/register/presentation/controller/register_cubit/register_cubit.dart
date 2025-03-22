import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/features/auth/register/data/models/register_model.dart';
import 'package:manfaz/features/auth/register/domain/use_cases/register_use_case.dart';
import 'package:meta/meta.dart';
import '../../../../../../core/error/failure.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;
  var nameController = TextEditingController(text: 'youssef emad eldin');
  var emailController =
      TextEditingController(text: 'youssefemad63.ye@gmail.com');
  var passwordController = TextEditingController(text: '01154516292');
  var phoneController = TextEditingController(text: '01154516292');
  var userType = 'user';
  RegisterCubit({required this.registerUseCase}) : super(RegisterInitial());

  Future<void> emitRegisterState() async {
    emit(RegisterLoading());
    var either = await registerUseCase.call(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      phone: phoneController.text,
      role: userType,
    );

    either.fold((l) => emit(RegisterError(failure: l)),
        (r) => emit(RegisterSuccess(registerModel: r)));
  }
}
