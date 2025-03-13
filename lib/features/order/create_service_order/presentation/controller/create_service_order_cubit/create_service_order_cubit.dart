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
  Map<String, dynamic>? selectedLocation;
  String? selectedPaymentMethod;
  
  final List<String> paymentMethods = [
    'cash',
    'credit_card',
    'tamara',
    'tabby'
  ];

  CreateServiceOrderCubit({required this.createServiceOrderUseCase})
      : super(CreateServiceOrderInitial()) {
    getUserId();
  }

  getUserId() async {
    String cachedUserId = await SharedPrefUtils.getData('userId');
    userId = cachedUserId;
  }

  void selectLocation(Map<String, dynamic> location) {
    selectedLocation = location;
    emit(LocationSelected(location: location));
  }

  void selectPaymentMethod(String method) {
    selectedPaymentMethod = method;
    emit(PaymentMethodSelected(paymentMethod: method));
  }

  void handleSubmit(Map<String, dynamic> arguments) {
    if (selectedLocation == null) {
      throw Exception('Please select a location');
    }

    if (selectedPaymentMethod == null) {
      throw Exception('Please select a payment method');
    }

    final serviceId = arguments['serviceId'] as String?;
    final workerId = arguments['workerId'] as String?;
    final price = arguments['price'] as double?;
    final duration = arguments['duration'] as int?;
    final totalAmount = arguments['totalAmount'] as double?;

    if (serviceId == null || workerId == null || price == null || duration == null || totalAmount == null) {
      throw Exception('Invalid order parameters');
    }

    createServiceOrder(
      serviceId: serviceId,
      providerId: workerId,
      price: price,
      duration: duration,
      totalAmount: totalAmount,
      paymentMethod: selectedPaymentMethod!,
      address: selectedLocation!['address'],
      latitude: selectedLocation!['latitude'],
      longitude: selectedLocation!['longitude'],
      notes: notesController.text,
      userId: userId,
      type: 'service',
      status: 'pending',
      paymentStatus: 'pending',
    );
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

  @override
  Future<void> close() {
    notesController.dispose();
    return super.close();
  }
}
