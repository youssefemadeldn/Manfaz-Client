import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/error/failure.dart';
import '../../../data/models/home_tab_model.dart';
import '../../../domain/use_cases/home_tab_use_case.dart';

part 'home_tab_state.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabUseCase homeTabUseCase;
  HomeTabCubit({required this.homeTabUseCase}) : super(HomeTabLoadingState());

  Future<void> emitHomeTabStates(BuildContext context) async {
    emit(HomeTabLoadingState());
    // final currentLanguage = context.locale.languageCode;
    final Either<Failure, HomeTabModel> eitherResponse =
        await homeTabUseCase.getHomeTabData();
    eitherResponse.fold(
      (failure) => emit(HomeTabErrorState(failure: failure)),
      (homeTapModel) => emit(HomeTabSuccessState(homeTapModel: homeTapModel)),
    );
  }
}
