import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/cache/shared_pref_utils.dart';
import '../../../../../../core/error/failure.dart';
import '../../../data/models/get_user_profile_model.dart';
import '../../../domin/use_cases/get_user_profile_by_id_use_case.dart';

part 'profile_tab_state.dart';

@injectable
class ProfileTabCubit extends Cubit<ProfileTabState> {
  final GetUserProfileByIdUseCase getUserProfileByIdUseCase;
  String id = '';
  ProfileTabCubit(this.getUserProfileByIdUseCase) : super(ProfileTabInitial()){
    getUserId();
  }

  Future<void> getUserId() async {
    id = await SharedPrefUtils.getData('userId');
    
  }

  Future<void> getUserProfileById() async {
    emit(ProfileTabLoading());
    final result = await getUserProfileByIdUseCase(id: id);
    result.fold(
      (failure) => emit(ProfileTabError(failure: failure)),
      (getUserProfile) => emit(ProfileTabSuccess(getUserProfile: getUserProfile)),
    );
  }
}
