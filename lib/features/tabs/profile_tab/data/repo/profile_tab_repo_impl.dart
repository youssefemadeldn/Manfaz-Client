import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/features/tabs/profile_tab/data/models/get_user_profile_model.dart';
import '../../domin/repo/base_profile_tab_repo.dart';
import '../data_source/remote/base_profile_tab_remote_data_source.dart';

@Injectable(as: BaseProfileTabRepo)
class ProfileTabRepoImpl implements BaseProfileTabRepo {
  final BaseProfileTabRemoteDataSource baseProfileTabRemoteDataSource;
  
  ProfileTabRepoImpl(this.baseProfileTabRemoteDataSource);

  @override
  Future<Either<Failure, GetUserProfileModel>> getUserProfileById({required String id}) {
    return baseProfileTabRemoteDataSource.getUserProfileById(id: id);
  }
}
