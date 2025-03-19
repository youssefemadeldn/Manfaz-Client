import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../data/models/orders_list_model.dart';

abstract class BaseOrdersTabRepo {
  Future<Either<Failure, OrdersListModel>> getOrdersTabData();
}
