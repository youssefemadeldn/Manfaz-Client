import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/error/failure.dart';
import '../../../data/models/services_based_on_category_model.dart';
import '../../../data/models/home_tab_model.dart';
import '../../../domain/use_cases/get_services_based_on_category_use_case.dart';
import '../../../domain/use_cases/home_tab_use_case.dart';

part 'home_tab_state.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabUseCase homeTabUseCase;
  GetServicesBasedOnCategoryUseCase getServicesBasedOnCategoryUseCase;
  HomeTabCubit(
      {required this.homeTabUseCase,
      required this.getServicesBasedOnCategoryUseCase})
      : super(HomeTabLoadingState());

  Future<void> emitHomeTabStates(BuildContext context) async {
    emit(HomeTabLoadingState());
    // final currentLanguage = context.locale.languageCode;
    final Either<Failure, HomeTabModel> eitherResponse =
        await homeTabUseCase.call();
    eitherResponse.fold(
      (failure) => emit(HomeTabErrorState(failure: failure)),
      (homeTapModel) => emit(HomeTabSuccessState(homeTapModel: homeTapModel)),
    );
  }

  Future<void> emitGetAllServicesStates() async {
    emit(ServiceBottomSheetLoadingState());
    final Either<Failure, ServicesBasedOnCategoryModel> eitherResponse =
        await getServicesBasedOnCategoryUseCase.call();
    eitherResponse.fold(
      (failure) => emit(ServiceBottomSheetErrorState(failure: failure)),
      (getServicesModel) => emit(ServiceBottomSheetSuccessState(servicesBasedOnCategoryModel: getServicesModel)),
    );
  }
}
