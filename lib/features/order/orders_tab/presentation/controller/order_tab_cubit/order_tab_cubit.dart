import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/error/failure.dart';
import '../../../data/models/orders_list_model.dart';
import '../../../domain/use_cases/get_orders_tab_use_case.dart';

part 'order_tab_state.dart';

@injectable
class OrderTabCubit extends Cubit<OrderTabState> {
  final GetOrdersTabUseCase getOrdersTabUseCase;
  OrderTabCubit(this.getOrdersTabUseCase) : super(OrderTabInitial());

  Future<void> getOrdersTabData() async {
    emit(OrderTabLoading());
    final result = await getOrdersTabUseCase.call();
    result.fold((failure) {
      emit(OrderTabError(failure));
    }, (ordersList) {
      emit(OrderTabSuccess(ordersList));
    });
  }
}
