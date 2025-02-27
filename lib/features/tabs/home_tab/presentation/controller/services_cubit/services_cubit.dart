import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/error/failure.dart';
import '../../../data/models/services_based_on_category_model.dart';
import '../../../domain/use_cases/get_services_based_on_category_use_case.dart';

part 'services_state.dart';

@injectable
class ServicesCubit extends Cubit<ServicesState> {
  GetServicesBasedOnCategoryUseCase getServicesBasedOnCategoryUseCase;
  
  ServicesCubit({required this.getServicesBasedOnCategoryUseCase})
      : super(ServicesInitial());

  Future<void> emitGetAllServicesStates(String categoryId, String type) async {
    emit(ServicesLoadingState());
    final Either<Failure, ServicesBasedOnCategoryModel> eitherResponse =
        await getServicesBasedOnCategoryUseCase.call(
            categoryId: categoryId, type: type);
    eitherResponse.fold(
      (failure) => emit(ServicesErrorState(failure: failure)),
      (getServicesModel) => emit(ServicesSuccessState(servicesBasedOnCategoryModel: getServicesModel)),
    );
  }
}
