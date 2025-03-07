import 'package:dartz/dartz.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/features/servicses/services_list_view_view/data/model/parameters_services_list_model.dart';

abstract class BaseServicesListViewRepo {
  Future<Either<Failure, ParametersServicesListModel>> getServicesParameters({
    required String categoryId,
    required String type,
  });
}
