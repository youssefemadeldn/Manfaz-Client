import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/di/di.dart';
import 'package:manfaz/core/helper/dialog_helper.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/widgets/error_message_widget.dart';
import 'package:manfaz/features/store/restaurant_store_details/data/models/store_details_model.dart';
import 'package:manfaz/features/store/restaurant_store_details/presentation/controller/create_delivery_order_cubit/create_delivery_order_cubit.dart';
import 'package:manfaz/features/store/restaurant_store_details/presentation/controller/restaurant_store_details_cubit/restaurant_store_details_cubit.dart';
import 'package:manfaz/features/store/restaurant_store_details/presentation/widgets/delivery_location_selector.dart';
import 'package:manfaz/features/store/restaurant_store_details/presentation/widgets/restaurant_header.dart';
import 'package:manfaz/features/store/restaurant_store_details/presentation/widgets/menu_categories_tab.dart';
import 'package:manfaz/features/store/restaurant_store_details/presentation/widgets/product_card.dart';
import 'package:manfaz/features/store/restaurant_store_details/presentation/widgets/working_hours_section.dart';
import 'package:manfaz/features/store/restaurant_store_details/presentation/widgets/gallery_section.dart';
import 'package:manfaz/features/order/create_service_order/presentation/widgets/notes_input.dart';
import 'package:manfaz/features/order/create_service_order/presentation/widgets/payment_method_selector.dart';

import '../../../../../core/helper/snack_bar_helper.dart';

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
  final TextEditingController _notesController = TextEditingController();
  String _selectedPaymentMethod = '';
  final List<String> _paymentMethods = ['cash', 'card'];
  final List<Map<String, dynamic>> _selectedProducts = [];

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
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<RestaurantStoreDetailsCubit>()
            ..getStoreDetails(storeId: widget.storeId),
        ),
        BlocProvider(
          create: (context) => getIt<CreateDeliveryOrderCubit>(),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: _buildContent(),
        floatingActionButton: _buildFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget _buildContent() {
    return BlocBuilder<RestaurantStoreDetailsCubit,
        RestaurantStoreDetailsState>(
      builder: (context, state) {
        if (state is RestaurantStoreDetailsLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        } else if (state is RestaurantStoreDetailsError) {
          return ErrorMessageWidget(errorMessage: state.failure.errorMessage);
        } else if (state is RestaurantStoreDetailsSuccess) {
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
                                _selectedCategoryIndex = 10;
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
                  // if (restaurantData.locations != null &&
                  //     restaurantData.locations!.isNotEmpty)
                  //   LocationMapSection(locations: restaurantData.locations),

                  // Divider
                  // Divider(color: AppColors.divider, thickness: 8.h),
                  BlocBuilder<CreateDeliveryOrderCubit,
                      CreateDeliveryOrderState>(
                    buildWhen: (previous, current) =>
                        current is DeliveryLocationSelected,
                    builder: (context, state) {
                      return DeliveryLocationSelector(
                        selectedLocation: context
                            .read<CreateDeliveryOrderCubit>()
                            .selectedLocation,
                        onLocationSelected: context
                            .read<CreateDeliveryOrderCubit>()
                            .selectLocation,
                      );
                    },
                  ),
                  // Notes Input
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: NotesInput(
                      controller: _notesController,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Payment Method Selector
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: PaymentMethodSelector(
                      selectedPaymentMethod: _selectedPaymentMethod,
                      paymentMethods: _paymentMethods,
                      onPaymentMethodSelected: (method) {
                        setState(() {
                          _selectedPaymentMethod = method;
                        });
                      },
                    ),
                  ),

                  // Bottom Padding
                  SizedBox(height: 80.h),
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
                    setState(() {
                      if (_selectedProducts
                          .any((element) => element['id'] == product.id)) {
                        _selectedProducts.removeWhere(
                            (element) => element['id'] == product.id);
                      } else {
                        _selectedProducts.add({
                          'id': product.id,
                          'name': product.name,
                          'price': product.price,
                          'quantity': 1,
                        });
                      }
                    });
                  },
                ))
            .toList(),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return BlocConsumer<CreateDeliveryOrderCubit, CreateDeliveryOrderState>(
      listener: (context, state) {
        if (state is CreateDeliveryOrderError) {
          // Handle error
          DialogHelper.showCustomDialog(
            content: Text(
              'error.try_again_later'.tr(),
              style: AppStyles.bodyText1,
              textAlign: TextAlign.center,
            ),
            context: context,
            title: Text(
              'error.error'.tr(),
              textAlign: TextAlign.center,
            ),
          );
        } else if (state is CreateDeliveryOrderSuccess) {
          DialogHelper.showCustomDialog(
            content: Text('success.order_created_successfully'.tr()),
            context: context,
            title: Text(
              'success.success'.tr(),
              textAlign: TextAlign.center,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is CreateDeliveryOrderLoading) {
          return FloatingActionButton.extended(
            onPressed: () {},
            label: const CircularProgressIndicator(
              color: AppColors.primary,
            ),
            backgroundColor: AppColors.white,
          );
        } else if (state is CreateDeliveryOrderSuccess) {
          return FloatingActionButton.extended(
            onPressed: () {
              final cubit = context.read<CreateDeliveryOrderCubit>();
              final restaurantData = context
                      .read<RestaurantStoreDetailsCubit>()
                      .state is RestaurantStoreDetailsSuccess
                  ? (context.read<RestaurantStoreDetailsCubit>().state
                          as RestaurantStoreDetailsSuccess)
                      .storeDetails
                      .data
                  : null;

              if (restaurantData == null) return;

              if (cubit.selectedLocation == null) {
                SnackBarHelper.showErrorSnackBar(
                  context,
                  message: 'Please select a delivery location',
                );
                return;
              }

              if (_selectedPaymentMethod.isEmpty) {
                SnackBarHelper.showErrorSnackBar(
                  message: 'Please select a payment method',
                   context,
                );
                return;
              }
              if(_notesController.text.isEmpty) {
                SnackBarHelper.showErrorSnackBar(
                  message: 'Please add notes',
                   context,
                );
                return;
              }

              cubit.createDeliveryOrder(
                userId: cubit.userId,

                type: "delivery",
                address: cubit.selectedLocation!['address'],
                latitude: cubit.selectedLocation!['latitude'],
                longitude: cubit.selectedLocation!['longitude'],
                price: 50.0,
                duration: 60,
                status: "pending",
                totalAmount: 50.0,
                paymentStatus: "pending",
                store: [
                  {
                    "storeId": restaurantData.id,
                    "products": _selectedProducts,
                  }
                ],
                notes: _notesController.text,
                paymentMethod: _selectedPaymentMethod,
              );
            },
            backgroundColor: AppColors.primary,
            label: Row(
              children: [
                Text(
                  '',
                  textAlign: TextAlign.center,
                  style: AppStyles.bodyText2.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  ' Place Order',
                  textAlign: TextAlign.center,
                  style: AppStyles.bodyText2.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        }
        return FloatingActionButton.extended(
          onPressed: () {
            final cubit = context.read<CreateDeliveryOrderCubit>();
            final restaurantData = context
                    .read<RestaurantStoreDetailsCubit>()
                    .state is RestaurantStoreDetailsSuccess
                ? (context.read<RestaurantStoreDetailsCubit>().state
                        as RestaurantStoreDetailsSuccess)
                    .storeDetails
                    .data
                : null;

            if (restaurantData == null) return;

            if (cubit.selectedLocation == null) {
              SnackBarHelper.showErrorSnackBar(
                message: 'Please select a delivery location',
                context,
              );
              return;
            }

            if (_selectedPaymentMethod.isEmpty) {
              SnackBarHelper.showErrorSnackBar(
                message: 'Please select a payment method',
                context,
              );
              return;
            }

            cubit.createDeliveryOrder(
              userId: cubit.userId,
              type: "delivery",
              address: cubit.selectedLocation!['address'],
              latitude: cubit.selectedLocation!['latitude'],
              longitude: cubit.selectedLocation!['longitude'],
              price: 50.0,
              duration: 60,
              status: "pending",
              totalAmount: 50.0,
              paymentStatus: "pending",
              store: [
                {
                  "storeId": restaurantData.id,
                  "products": _selectedProducts,
                }
              ],
              notes: _notesController.text,
              paymentMethod: _selectedPaymentMethod,
            );
          },
          backgroundColor: AppColors.primary,
          label: Row(
            children: [
              Text(
                '',
                textAlign: TextAlign.center,
                style: AppStyles.bodyText2.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                ' Place Order',
                textAlign: TextAlign.center,
                style: AppStyles.bodyText2.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
