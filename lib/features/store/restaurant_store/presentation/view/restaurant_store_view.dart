import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:manfaz/core/widgets/error_message_widget.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../data/models/store_sub_categories_list.dart';
import '../controller/restaurant_store_cubit/restaurant_store_cubit.dart';
import '../controller/store_sub_categories_cubit/store_sub_categories_cubit.dart';
import '../widgets/DistanceLocation.dart';
import '../widgets/LogoOrganization.dart';
import '../../data/models/store_list_model.dart';

// ignore: must_be_immutable
class RestaurantStoreView extends StatelessWidget {
  List<BaseStore>? stores;
  final String? id;

  RestaurantStoreView({super.key, this.stores, this.id});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<RestaurantStoreCubit>()
            ..getStoreList(limit: 10, page: 1, search: '', categoryId: id!),
        ),
        BlocProvider(
          create: (context) => getIt<StoreSubCategoriesCubit>()
            ..getStoreSubCategories(
              categoryId: id!,
              limit: 10,
              page: 1,
              search: '',
            ),
        ),
      ],
      child: BlocBuilder<StoreSubCategoriesCubit, StoreSubCategoriesState>(
        builder: (context, subCategoriesState) {
          List<StoreSubCategory>? subCategories;
          if (subCategoriesState is StoreSubCategoriesSuccess) {
            subCategories =
                subCategoriesState.storeSubCategoriesList.data ?? [];
          }

          return DefaultTabController(
            length: subCategories?.length ?? 0,
            child: Scaffold(
              backgroundColor: AppColors.background,
              appBar: AppBar(
                backgroundColor: AppColors.background,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios,
                      color: AppColors.textSecondary),
                  onPressed: () => Navigator.pop(context),
                ),
                title: _buildSearchBar(),
              ),
              body: BlocBuilder<RestaurantStoreCubit, RestaurantStoreState>(
                builder: (context, state) {
                  if (state is RestaurantStoreLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  } else if (state is RestaurantStoreError) {
                    return ErrorMessageWidget(
                        errorMessage: state.failure.errorMessage);
                  } else if (state is RestaurantStoreSuccess) {
                    stores = state.storeListModel.data?.stores ?? [];

                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 8.h),
                          child: BlocBuilder<StoreSubCategoriesCubit,
                              StoreSubCategoriesState>(
                            builder: (context, state) {
                              if (state is StoreSubCategoriesLoading) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primary,
                                  ),
                                );
                              } else if (state is StoreSubCategoriesError) {
                                return ErrorMessageWidget(
                                    errorMessage: state.failure.errorMessage);
                              } else if (state is StoreSubCategoriesSuccess) {
                                final subCategoriesList =
                                    state.storeSubCategoriesList.data ?? [];
                                return ButtonsTabBar(
                                    backgroundColor: AppColors.primary,
                                    unselectedBackgroundColor: Colors.white,
                                    labelStyle: AppStyles.subtitle2.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    unselectedLabelStyle:
                                        AppStyles.subtitle2.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                    borderWidth: 1,
                                    borderColor: AppColors.primary,
                                    unselectedBorderColor:
                                        AppColors.primary.withOpacity(0.3),
                                    radius: 100,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    height: 45.h,
                                    tabs: subCategoriesList
                                        .map((e) => Tab(
                                              icon: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 8.w),
                                              ),
                                              text: e.name,
                                            ))
                                        .toList());
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                        Expanded(
                          child: BlocBuilder<StoreSubCategoriesCubit,
                              StoreSubCategoriesState>(
                            builder: (context, state) {
                              if (state is StoreSubCategoriesSuccess) {
                                final subCategoriesList =
                                    state.storeSubCategoriesList.data ?? [];
                                return TabBarView(
                                  children: subCategoriesList
                                      .map((e) => _buildDeliveryList(e.id!))
                                      .toList(),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search in Food & Beverages',
          hintStyle: AppStyles.subtitle2.copyWith(color: AppColors.textHint),
          prefixIcon: Icon(Icons.search, color: AppColors.primary),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        ),
      ),
    );
  }

  Widget _buildDeliveryList(String category) {
    return ListView.builder(
      padding: EdgeInsets.all(16.r),
      itemCount: stores?.length ?? 0,
      itemBuilder: (context, index) => StoreCardItem(
        store: stores?[index],
      ),
    );
  }
}

class StoreCardItem extends StatelessWidget {
  final BaseStore? store;

  const StoreCardItem({super.key, this.store});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: Navigate to store details
      },
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16.r)),
                  child: CachedNetworkImage(
                    imageUrl: store!.coverImage!,
                    height: 160.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 160.h,
                      color: Colors.grey[200],
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 160.h,
                      color: Colors.grey[200],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_not_supported, color: Colors.grey),
                          SizedBox(height: 4.h),
                          Text(
                            'Image not available',
                            style: AppStyles.caption.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (store?.locations != null && store!.locations!.isNotEmpty)
                  Positioned(
                    right: 10.w,
                    bottom: -30.h,
                    child: DistanceLocation(),
                  ),
                Positioned(
                  bottom: -30.h,
                  left: 16.w,
                  child: LogoOrganization(logoUrl: store?.logo),
                ),
                // Status Badge
                if (store?.status != null)
                  Positioned(
                    top: 16.h,
                    right: 16.w,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: store?.status == 'OPEN'
                            ? Colors.green.withOpacity(0.9)
                            : Colors.red.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(100.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 6.w,
                            height: 6.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            store?.status ?? '',
                            style: AppStyles.caption.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 40.h, 16.w, 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              store?.name ?? 'Restaurant Name',
                              style: AppStyles.subtitle1.copyWith(
                                color: AppColors.textSecondary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (store?.category != null)
                              Text(
                                store?.category?.name ?? '',
                                style: AppStyles.caption.copyWith(
                                  color: AppColors.textHint,
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (store?.minOrderAmount != null)
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            'Min. ${store?.minOrderAmount} SAR',
                            style: AppStyles.caption.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 18.sp),
                            SizedBox(width: 4.w),
                            Text(
                              '${store?.rating ?? 0}',
                              style: AppStyles.bodyText2.copyWith(
                                color: Colors.amber[700],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '(${store?.reviewsCount ?? 0}+ Ratings)',
                        style: AppStyles.bodyText2.copyWith(
                          color: AppColors.textHint,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildInfoChip(
                          icon: Icons.delivery_dining,
                          text: 'Delivery ${store?.deliveryFee ?? 0} SAR',
                        ),
                        SizedBox(width: 8.w),
                        if (store?.workingHours != null &&
                            store!.workingHours!.isNotEmpty)
                          _buildInfoChip(
                            icon: Icons.access_time,
                            text: _formatWorkingHours(
                              store?.workingHours?[0].openTime,
                              store?.workingHours?[0].closeTime,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip({required IconData icon, required String text}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 18.sp,
          ),
          SizedBox(width: 6.w),
          Text(
            text,
            style: AppStyles.bodyText2.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _formatWorkingHours(String? openTime, String? closeTime) {
    if (openTime == null || closeTime == null) return 'Hours N/A';
    return '${openTime.substring(0, 5)} - ${closeTime.substring(0, 5)}';
  }
}
