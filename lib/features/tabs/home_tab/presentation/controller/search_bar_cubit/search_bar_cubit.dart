import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../../../core/cache/shared_pref_utils.dart';

part 'search_bar_state.dart';

@injectable
class SearchBarCubit extends Cubit<SearchBarState> {
  SearchBarCubit() : super(SearchBarInitial()) {
    loadCachedAddress();
    getUserName();
  }

  String currentAddress = '';
  String userName = 'Hi, Guest';

  Future<void> loadCachedAddress() async {
    try {
      emit(SearchBarLoading());
      final cachedAddress = SharedPrefUtils.getData('current_address');
      if (cachedAddress != null) {
        currentAddress = cachedAddress.toString();
        emit(SearchBarLoaded(currentAddress));
      } else {
        emit(SearchBarLoaded(''));
      }
    } catch (e) {
      emit(SearchBarError(e.toString()));
    }
  }

  Future<void> getUserName() async {
    try {
      final name = SharedPrefUtils.getData('userName');
      if (name != null) {
        userName = 'Hi, ${name.toString()}';
        emit(SearchBarLoaded(currentAddress)); // Emit to trigger UI update
      }
    } catch (e) {
      emit(SearchBarError(e.toString()));
    }
  }
}
