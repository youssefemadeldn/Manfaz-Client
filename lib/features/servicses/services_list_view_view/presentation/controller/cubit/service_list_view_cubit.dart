import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/error/failure.dart';
import '../../../data/model/parameters_services_list_model.dart';
import '../../../domain/use_cases/get_services_parameters_use_case.dart';

part 'service_list_view_state.dart';

@injectable
class ServiceListViewCubit extends Cubit<ServiceListViewState> {
  final ServicesListParametersUseCase servicesListParametersUseCase;

  ServiceListViewCubit(this.servicesListParametersUseCase) : super(ServiceListViewInitial());

  Future<void> getServicesParametersList({
    required String categoryId,
    required String type,
  }) async {
    emit(ServiceListViewLoading());
    final result = await servicesListParametersUseCase.call(
      categoryId: categoryId,
      type: type,
    );
    result.fold(
      (failure) => emit(ServiceListViewFailure(failure)),
      (success) => emit(ServiceListViewSuccess(success)),
    );
  }

}
