import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/features/register/data/models/register_model.dart';
import '../../domain/repo/base_register_repo.dart';
import '../data_source/remote/base_register_remote_data_source.dart';

@Injectable(as: BaseRegisterRepo)
class RegisterRepoImpl implements BaseRegisterRepo {
  final BaseRegisterRemoteDataSource registerRemoteDataSource;
  RegisterRepoImpl({required this.registerRemoteDataSource});
  @override
  Future<Either<Failure, RegisterModel>> register({required String name, required String email, required String password, required String phone}) async{
    var result = await registerRemoteDataSource.register(
        name: name, email: email, password: password, phone: phone);
    return result.fold((failure)=> left(failure), (registerModel) => right(registerModel));
  }
}