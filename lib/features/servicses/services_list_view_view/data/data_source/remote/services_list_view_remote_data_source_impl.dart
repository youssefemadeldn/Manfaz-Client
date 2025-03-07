import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/core/network/api_constant.dart';
import 'package:manfaz/core/network/api_manager.dart';
import 'package:manfaz/core/network/network_helper.dart';
import 'package:manfaz/features/servicses/services_list_view_view/data/data_source/remote/base_services_list_view_remote_data_source.dart';
import 'package:manfaz/features/servicses/services_list_view_view/data/model/parameters_services_list_model.dart';

import '../../../../../../core/di/di.dart';
import '../../../../../../core/helper/easy_localization_helper.dart';

@Injectable(as: BaseServicesListViewRemoteDataSource)
class ServicesListViewRemoteDataSourceImpl implements BaseServicesListViewRemoteDataSource {
  ApiManager apiManager = getIt<ApiManager>();

  @override
  Future<Either<Failure, ParametersServicesListModel>> getServicesParameters({
    required String categoryId,
    required String type,
  }) async {
    // try {
      final currentLanguage = EasyLocalizationHelper().getCurrentLocale();
      
      var response = await apiManager.getData(
        ApiConstant.epServiceParameters,
        queryParameters: {
          'lang': currentLanguage,
          'categoryId': categoryId,
          'type': type,
        },
      );
      
      ParametersServicesListModel servicesListModel = ParametersServicesListModel.fromJson(response.data);

      if (NetworkHelper.isValidResponse(code: servicesListModel.code)) {
        return right(servicesListModel);
      } else {
        return left(ServerFailure(
          failureTitle: 'Server Failure',
          errorMessage: servicesListModel.message!,
        ));
      }
    // }
    //  catch (e) {
    //   return left(Failure(
    //     failureTitle: 'Server Failure',
    //     errorMessage: e.toString(),
    //   ));
    // }
  }
}
