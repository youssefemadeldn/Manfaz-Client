import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failure.dart';
import '../../../get_user_location/data/models/save_user_location_response_model.dart';
import '../../domain/repo/base_save_location_repo.dart';
import '../data_source/remote/base_save_location_remote_data_source.dart';

@Injectable(as: BaseSaveLocationRepo)
class SaveLocationRepoImpl implements BaseSaveLocationRepo {
  final BaseSaveLocationRemoteDataSource baseSaveLocationRemoteDataSource;

  SaveLocationRepoImpl(this.baseSaveLocationRemoteDataSource);

  @override
  Future<Either<Failure, SaveUserLocationResponseModel>> saveUserLocation({
    required String address,
    required double latitude,
    required double longitude,
    required String type,
    String? name,
    String? notes,
  }) {
    return baseSaveLocationRemoteDataSource.saveUserLocation(
      address: address,
      latitude: latitude,
      longitude: longitude,
      type: type,
      name: name,
      notes: notes,
    );
  }
}
