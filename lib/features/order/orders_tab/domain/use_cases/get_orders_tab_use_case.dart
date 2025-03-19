import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failure.dart';
import '../../data/models/orders_list_model.dart';
import '../repo/base_orders_tab_repo.dart';

@injectable
class GetOrdersTabUseCase  {
  final BaseOrdersTabRepo baseOrdersTabRepo;

  GetOrdersTabUseCase(this.baseOrdersTabRepo);

  Future<Either<Failure, OrdersListModel>> call() async {
    return await baseOrdersTabRepo.getOrdersTabData();
  }
}
