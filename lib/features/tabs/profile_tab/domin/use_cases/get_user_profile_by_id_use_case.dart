import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart';
import '../../data/models/get_user_profile_model.dart';
import '../repo/base_profile_tab_repo.dart';

@injectable
class GetUserProfileByIdUseCase {
  final BaseProfileTabRepo baseProfileTabRepo;

  GetUserProfileByIdUseCase(this.baseProfileTabRepo);

  Future<Either<Failure, GetUserProfileModel>> call({required String id}) =>
      baseProfileTabRepo.getUserProfileById(id: id);
}
