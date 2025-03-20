import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/di/di.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/widgets/states/home_tab_error.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../data/models/store_details_model.dart';
import '../controller/restaurant_store_details_cubit/restaurant_store_details_cubit.dart';
import '../widgets/restaurant_header.dart';
import '../widgets/menu_categories_tab.dart';
import '../widgets/product_card.dart';
import '../widgets/working_hours_section.dart';
import '../widgets/location_map_section.dart';
import '../widgets/gallery_section.dart';

class RestaurantStoreDetailsView extends StatefulWidget {
  final String storeId;

  const RestaurantStoreDetailsView({
    super.key,
    required this.storeId,
  });

  @override
  State<RestaurantStoreDetailsView> createState() =>
      _RestaurantStoreDetailsViewState();
}

class _RestaurantStoreDetailsViewState extends State<RestaurantStoreDetailsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 1,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RestaurantStoreDetailsCubit>()
        ..getStoreDetails(storeId: widget.storeId),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: _buildContent(),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  Widget _buildContent() {
    return BlocBuilder<RestaurantStoreDetailsCubit, RestaurantStoreDetailsState>(
      builder: (context, state) {
        if(state is RestaurantStoreDetailsLoading){
          return Center(child: CircularProgressIndicator(
              color: AppColors.primary,
          ),);
        }else if(state is RestaurantStoreDetailsError){
          return ErrorMessageWidget(errorMessage: state.failure.errorMessage);
        }else if(state is RestaurantStoreDetailsSuccess){
          final storeDetails = state.storeDetails;
          final restaurantData = storeDetails.data;
          
          if (restaurantData == null) {
            return Center(
              child: Text(
                'No restaurant data available',
                style: AppStyles.bodyText2,
              ),
            );
          }
          
          // Initialize tab controller with the number of categories
          final categoriesLength = restaurantData.categories?.length ?? 0;
          if (_tabController.length != categoriesLength) {
            _tabController = TabController(
              length: categoriesLength > 0 ? categoriesLength : 1,
              vsync: this,
            );
            
            _tabController.addListener(() {
              if (!_tabController.indexIsChanging) {
                setState(() {
                  _selectedCategoryIndex = _tabController.index;
                });
              }
            });
          }

          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Restaurant Header (Cover Image, Logo, Name, Rating, etc.)
                  RestaurantHeader(restaurantData: restaurantData),

                  // Menu Categories Tabs
                  if (restaurantData.categories != null &&
                      restaurantData.categories!.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Menu Title
                          Row(
                            children: [
                              Icon(Icons.restaurant_menu,
                                  color: AppColors.primary),
                              SizedBox(width: 8.w),
                              Text(
                                'Menu',
                                style: AppStyles.header3,
                              ),
                            ],
                          ),

                          SizedBox(height: 16.h),

                          // Categories Tabs
                          MenuCategoriesTab(
                            categories: restaurantData.categories!,
                            tabController: _tabController,
                            selectedIndex: _selectedCategoryIndex,
                            onCategorySelected: (index) {
                              setState(() {
                                _selectedCategoryIndex = index;
                                _tabController.animateTo(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                  // Products List based on selected category
                  if (restaurantData.products != null &&
                      restaurantData.products!.isNotEmpty)
                    _buildProductsList(restaurantData),

                  SizedBox(height: 16.h),

                  // Divider
                  Divider(color: AppColors.divider, thickness: 8.h),

                  // Gallery Section
                  if (restaurantData.images != null &&
                      restaurantData.images!.isNotEmpty)
                    GallerySection(images: restaurantData.images),

                  // Divider
                  Divider(color: AppColors.divider, thickness: 8.h),

                  // Working Hours Section
                  if (restaurantData.workingHours != null &&
                      restaurantData.workingHours!.isNotEmpty)
                    WorkingHoursSection(
                        workingHours: restaurantData.workingHours!),

                  // Divider
                  Divider(color: AppColors.divider, thickness: 8.h),

                  // Location Map Section
                  if (restaurantData.locations != null &&
                      restaurantData.locations!.isNotEmpty)
                    LocationMapSection(locations: restaurantData.locations),

                  // Bottom Padding
                  SizedBox(
                      height: 80.h), // Extra space for the floating action button
                ],
              ),
            ),
          );
        
        }
        return SizedBox.shrink();
      },
    );
  }

  Widget _buildProductsList(Data restaurantData) {
    final categories = restaurantData.categories;
    final products = restaurantData.products;

    if (categories == null ||
        products == null ||
        categories.isEmpty ||
        products.isEmpty) {
      return SizedBox.shrink();
    }

    // Filter products by the selected category
    final selectedCategoryId = categories[_selectedCategoryIndex].id;
    final categoryProducts = products
        .where((product) => product.categoryId == selectedCategoryId)
        .toList();

    if (categoryProducts.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(16.w),
        child: Center(
          child: Text(
            'No products available in this category',
            style: AppStyles.bodyText2,
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: categoryProducts
            .map((product) => ProductCard(
                  product: product,
                  onTap: () {
                    // Product details action
                  },
                ))
            .toList(),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        // Cart action
      },
      backgroundColor: AppColors.primary,
      icon: Icon(
        Icons.shopping_cart,
        color: AppColors.white,
      ),
      label: Text('Cart',
      style: AppStyles.bodyText2.copyWith(
        color: AppColors.white,
        fontWeight: FontWeight.w600,
      ),
      ),
    );
  }
}
