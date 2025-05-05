import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failure.dart';
import '../repo/base_user_locations_repo.dart';
import '../../data/models/get_user_locations_response_model.dart';

@injectable
class GetUserLocationsUseCase {
  final BaseUserLocationsRepo baseUserLocationsRepo;
  
  GetUserLocationsUseCase(this.baseUserLocationsRepo);

  Future<Either<Failure, GetUserLocationsResponseModel>> call({
    required String userId,
  }) {
    return baseUserLocationsRepo.getUserLocations(
      userId: userId,
    );
  }
}
