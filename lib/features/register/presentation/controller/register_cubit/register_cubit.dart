import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/features/register/data/models/register_model.dart';
import 'package:manfaz/features/register/domain/use_cases/register_use_case.dart';
import 'package:meta/meta.dart';
import '../../../../../core/error/failure.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;
  var nameController = TextEditingController(text: 'youssef');
  var emailController = TextEditingController(text: 'Jo90@gmail.com');
  var passwordController = TextEditingController(text: 'Jo12345678');
  var phoneController = TextEditingController(text: '01271944961');
  RegisterCubit({required this.registerUseCase}) : super(RegisterInitial());

  emitRegisterState() async {
    emit(RegisterLoading());
    var either = await registerUseCase.call(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      phone: phoneController.text,
    );

    either.fold((l) => emit(RegisterError(failure: l)),
        (r) => emit(RegisterSuccess(registerModel: r)));
  }
}
