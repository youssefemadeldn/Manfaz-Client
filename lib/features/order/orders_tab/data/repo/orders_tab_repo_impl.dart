import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart';
import '../../domain/repo/base_orders_tab_repo.dart';
import '../data_source/remote/base_orders_tab_remote_data_source.dart';
import '../models/orders_list_model.dart';

@Injectable(as: BaseOrdersTabRepo)
class OrdersTabRepoImpl implements BaseOrdersTabRepo {
  final BaseOrdersTabRemoteDataSource baseOrdersTabRemoteDataSource;

  OrdersTabRepoImpl(this.baseOrdersTabRemoteDataSource);

  @override
  Future<Either<Failure, OrdersListModel>> getOrdersTabData() async {
    return await baseOrdersTabRemoteDataSource.getOrdersTabData();
  }
}
