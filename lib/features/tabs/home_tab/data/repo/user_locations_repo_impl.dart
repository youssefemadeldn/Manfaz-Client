import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failure.dart';
import '../../domain/repo/base_user_locations_repo.dart';
import '../data_source/remote/base_user_locations_remote_data_source.dart';
import '../models/get_user_locations_response_model.dart';

@Injectable(as: BaseUserLocationsRepo)
class UserLocationsRepoImpl implements BaseUserLocationsRepo {
  final BaseUserLocationsRemoteDataSource baseUserLocationsRemoteDataSource;

  UserLocationsRepoImpl(this.baseUserLocationsRemoteDataSource);

  @override
  Future<Either<Failure, GetUserLocationsResponseModel>> getUserLocations({
    required String userId,
  }) {
    return baseUserLocationsRemoteDataSource.getUserLocations(
      userId: userId,
    );
  }
}
