import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/core/cache/shared_pref_utils.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/error/failure.dart';
import '../../../data/models/create_delivery_order_model.dart';
import '../../../domin/use_cases/create_delivery_order_use_case.dart';

part 'create_delivery_order_state.dart';

@injectable
class CreateDeliveryOrderCubit extends Cubit<CreateDeliveryOrderState> {
  final CreateDeliveryOrderUseCase createDeliveryOrderUseCase;
  late String userId;
  CreateDeliveryOrderCubit({required this.createDeliveryOrderUseCase}) : super(CreateDeliveryOrderInitial()){
   getUserId();
  }
  Future<void> getUserId()async{
     userId = await SharedPrefUtils.getData('userId');
  }
  Future<void> createDeliveryOrder({
    required String userId,
    required String address,
    required String notes,
    required double latitude,
    required double longitude,
    required double price,
    required int duration,
    required String status,
    required double totalAmount,
    required String paymentStatus,
    required String type,
    required List<Map<String, dynamic>> store,
    required String paymentMethod,
    
  }) async {
    emit(CreateDeliveryOrderLoading());
    final result = await createDeliveryOrderUseCase.call(
      userId: userId,
      address: address,
      notes: notes,
      latitude: latitude,
      longitude: longitude,
      price: price,
      duration: duration,
      status: status,
      totalAmount: totalAmount,
      paymentStatus: paymentStatus,
      type: type,
      store: store,
      paymentMethod: paymentMethod,
    );
    result.fold(
      (failure) => emit(CreateDeliveryOrderError(failure: failure)),
      (createDeliveryOrderModel) => emit(CreateDeliveryOrderSuccess(createDeliveryOrderModel: createDeliveryOrderModel)),
    );
  }
}
