import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/error/failure.dart';
import '../../../data/models/store_list_model.dart';
import '../../../domain/use_cases/restaurant_store_use_case.dart';

part 'restaurant_store_state.dart';

@injectable
class RestaurantStoreCubit extends Cubit<RestaurantStoreState> {
  final RestaurantStoreUseCase restaurantStoreUseCase;
  RestaurantStoreCubit({ required this.restaurantStoreUseCase}) : super(RestaurantStoreInitial());

  Future<void> getStoreList({
    required int limit,
    required int page,
    required String search,
    required String categoryId,
    String? filterId,
  }) async {
    emit(RestaurantStoreLoading());
    final result = await restaurantStoreUseCase(
      limit: limit,
      page: page,
      search: search,
      categoryId: categoryId,
      filterId: filterId!,
    );
    result.fold(
      (failure) => emit(RestaurantStoreError(failure: failure)),
      (storeListModel) => emit(RestaurantStoreSuccess(storeListModel: storeListModel)),
    );
  }
}
