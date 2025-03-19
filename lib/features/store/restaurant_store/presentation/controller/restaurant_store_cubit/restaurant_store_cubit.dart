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
  
  // Add current values to track across reloads
  String _currentFilterId = '';
  String _currentCategoryId = '';
  int _currentLimit = 10;
  int _currentPage = 1;
  String _currentSearch = '';
  
  RestaurantStoreCubit({ required this.restaurantStoreUseCase}) : super(RestaurantStoreInitial());

  // Getter for current filter ID
  String get currentFilterId => _currentFilterId;

  Future<void> getStoreList({
    required int limit,
    required int page,
    required String search,
    required String categoryId,
    String? filterId,
  }) async {
    emit(RestaurantStoreLoading());
    
    // Update the current values
    _currentLimit = limit;
    _currentPage = page;
    _currentSearch = search;
    _currentCategoryId = categoryId;
    if (filterId != null) {
      _currentFilterId = filterId;
    }
    
    final result = await restaurantStoreUseCase(
      limit: limit,
      page: page,
      search: search,
      categoryId: categoryId,
      filterId: _currentFilterId,
    );
    result.fold(
      (failure) => emit(RestaurantStoreError(failure: failure)),
      (storeListModel) => emit(RestaurantStoreSuccess(
        storeListModel: storeListModel,
        filterId: _currentFilterId,
      )),
    );
  }
  
  // Method to update filter ID and reload data
  void updateFilterId(String filterId) {
    if (_currentFilterId != filterId) {
      getStoreList(
        limit: _currentLimit,
        page: _currentPage,
        search: _currentSearch,
        categoryId: _currentCategoryId,
        filterId: filterId,
      );
    }
  }
}
