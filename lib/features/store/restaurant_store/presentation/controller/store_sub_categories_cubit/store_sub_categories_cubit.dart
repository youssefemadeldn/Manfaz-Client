import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/error/failure.dart';
import '../../../data/models/store_sub_categories_list.dart';
import '../../../domain/use_cases/get_store_sub_categories_by_category_id.dart';

part 'store_sub_categories_state.dart';

@injectable
class StoreSubCategoriesCubit extends Cubit<StoreSubCategoriesState> {
  final GetStoreSubCategoriesByCategoryId getStoreSubCategoriesByCategoryId;
  StoreSubCategoriesCubit({required this.getStoreSubCategoriesByCategoryId}) : super(StoreSubCategoriesInitial());

  Future<void> getStoreSubCategories({
    required String categoryId,
    required int limit,
    required int page,
    String? search,
  }) async {
    emit(StoreSubCategoriesLoading());
    final result = await getStoreSubCategoriesByCategoryId(
      categoryId: categoryId,
      limit: limit,
      page: page,
      search: search,
    );
    result.fold(
      (failure) => emit(StoreSubCategoriesError(failure: failure)),
      (storeSubCategoriesList) =>
          emit(StoreSubCategoriesSuccess(storeSubCategoriesList: storeSubCategoriesList)),
    );
  }
}
