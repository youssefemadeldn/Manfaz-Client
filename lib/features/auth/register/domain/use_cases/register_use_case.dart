import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failure.dart';
import '../../data/models/register_model.dart';
import '../repo/base_register_repo.dart';

@injectable
class RegisterUseCase {
  BaseRegisterRepo registerRepo;

  RegisterUseCase({required this.registerRepo});

  Future<Either<Failure, RegisterModel>> call({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String role,
  }) async {
    return await registerRepo.register(
      name: name,
      email: email,
      password: password,
      phone: phone,
      role: role,
    );
  }
}
