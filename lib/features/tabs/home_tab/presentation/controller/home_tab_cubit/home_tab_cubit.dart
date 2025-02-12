import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../../../core/error/failure.dart';
import '../../../data/models/home_tab_model.dart';
import '../../../domain/use_cases/home_tab_use_case.dart';

part 'home_tab_state.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabUseCase homeTabUseCase;
  HomeTabCubit({required this.homeTabUseCase}) : super(HomeTabLoadingState());

  Future<void> emitHomeTabStates() async {
    emit(HomeTabLoadingState());
    final Either<Failure, HomeTapModel> eitherResponse =
        await homeTabUseCase.getHomeTabData();
    eitherResponse.fold(
      (failure) => emit(HomeTabErrorState(failure: failure)),
      (homeTapModel) => emit(HomeTabSuccessState(homeTapModel: homeTapModel)),
    );
  }
}
