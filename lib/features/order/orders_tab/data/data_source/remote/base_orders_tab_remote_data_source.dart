import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failure.dart';
import '../../models/orders_list_model.dart';

abstract class BaseOrdersTabRemoteDataSource {
  Future<Either<Failure, OrdersListModel>> getOrdersTabData();
}
