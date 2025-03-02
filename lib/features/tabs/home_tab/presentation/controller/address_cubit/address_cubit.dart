import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../../../core/cache/shared_pref_utils.dart';

part 'address_state.dart';

@injectable
class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial()) {
    loadCachedAddress();
  }

  String currentAddress = '';

  Future<void> loadCachedAddress() async {
    try {
      emit(AddressLoading());
      final cachedAddress = SharedPrefUtils.getData('current_address');
      if (cachedAddress != null) {
        currentAddress = cachedAddress.toString();
        emit(AddressLoaded(currentAddress));
      } else {
        emit( AddressLoaded(''));
      }
    } catch (e) {
      emit(AddressError(e.toString()));
    }
  }
}
