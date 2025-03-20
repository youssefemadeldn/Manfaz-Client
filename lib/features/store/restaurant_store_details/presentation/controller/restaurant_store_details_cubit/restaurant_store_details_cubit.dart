import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/error/failure.dart';
import '../../../data/models/store_details_model.dart';
import '../../../domin/use_cases/get_store_details_use_case.dart';

part 'restaurant_store_details_state.dart';

@injectable
class RestaurantStoreDetailsCubit extends Cubit<RestaurantStoreDetailsState> {
  final GetStoreDetailsUseCase getStoreDetailsUseCase;
  RestaurantStoreDetailsCubit({required this.getStoreDetailsUseCase}) : super(RestaurantStoreDetailsInitial());

  Future<void> getStoreDetails({required String storeId}) async {
    emit(RestaurantStoreDetailsLoading());
    final result = await getStoreDetailsUseCase.call(storeId: storeId);
    result.fold(
      (failure) => emit(RestaurantStoreDetailsError(failure: failure)),
      (storeDetails) => emit(RestaurantStoreDetailsSuccess(storeDetails: storeDetails)),
    );
  }

}
