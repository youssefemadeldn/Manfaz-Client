import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/cache/shared_pref_utils.dart';
import '../../../../../../core/error/failure.dart';
import '../../../data/models/create_service_order_model.dart';
import '../../../domin/use_cases/create_service_order_use_case.dart';
part 'create_service_order_state.dart';

@injectable
class CreateServiceOrderCubit extends Cubit<CreateServiceOrderState> {
  final CreateServiceOrderUseCase createServiceOrderUseCase;
  TextEditingController notesController = TextEditingController();
  late String userId;
  CreateServiceOrderCubit({required this.createServiceOrderUseCase})
      : super(CreateServiceOrderInitial()) {
    getUserId();
  }

  getUserId() async {
    String cachedUserId = await SharedPrefUtils.getData('userId');
    userId = cachedUserId;
  }

  Future<void> createServiceOrder({
    required String userId,
    required String serviceId,
    required String providerId,
    required String notes,
    required double price,
    required int duration,
    required String status,
    required double totalAmount,
    required String paymentStatus,
    required String type,
    required String paymentMethod,
    required String address,
    required double latitude,
    required double longitude,
  }) async {
    emit(CreateServiceOrderLoading());
    final result = await createServiceOrderUseCase(
      userId: userId,
      serviceId: serviceId,
      providerId: providerId,
      notes: notes,
      price: price,
      duration: duration,
      status: status,
      totalAmount: totalAmount,
      paymentStatus: paymentStatus,
      type: type,
      paymentMethod: paymentMethod,
      address: address,
      latitude: latitude,
      longitude: longitude,
    );
    result.fold(
      (failure) => emit(CreateServiceOrderFailure(failure: failure)),
      (createServiceOrderModel) => emit(
        CreateServiceOrderSuccess(
            createServiceOrderModel: createServiceOrderModel),
      ),
    );
  }
}
