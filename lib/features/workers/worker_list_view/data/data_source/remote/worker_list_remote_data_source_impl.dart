import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/features/workers/worker_list_view/data/data_source/remote/base_worker_list_remote_data_source.dart';
import 'package:manfaz/features/workers/worker_list_view/data/models/worker_list_model.dart';

import '../../../../../../core/di/di.dart';
import '../../../../../../core/helper/easy_localization_helper.dart';
import '../../../../../../core/network/api_constant.dart';
import '../../../../../../core/network/api_manager.dart';
import '../../../../../../core/network/network_helper.dart';

@Injectable(as: BaseWorkerListRemoteDataSource)
class WorkerListRemoteDataSourceImpl implements BaseWorkerListRemoteDataSource {
  ApiManager apiManager = getIt<ApiManager>();

  @override
  Future<Either<Failure, WorkerListModel>> getWorkerList() async {
    try {
      final currentLanguage = EasyLocalizationHelper().getCurrentLocale();
      var response = await apiManager.getData(
        ApiConstant.epWorkerList,
        queryParameters: {'lang': currentLanguage},
      );

      WorkerListModel workerListModel = WorkerListModel.fromJson(response.data);

      if (NetworkHelper.isValidResponse(code: workerListModel.code)) {
        return right(workerListModel);
      } else {
        return left(ServerFailure(
          failureTitle: 'Server Failure',
          errorMessage: workerListModel.message!,
        ));
      }
    } catch (e) {
      return left(ServerFailure(
        failureTitle: 'Server Failure',
        errorMessage: e.toString(),
      ));
    }
  }
}
