import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/di/di.dart';
import 'package:manfaz/core/helper/dialog_helper.dart';
import 'package:manfaz/core/routes/routes.dart';
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
  double _totalPrice = 0.0;

  void _updateProductQuantity(String productId, String productName, double price, int quantity) {
    setState(() {
      var existingProductIndex = _selectedProducts.indexWhere(
        (product) => product['productId'] == productId,
      );

      if (existingProductIndex == -1) {
        if (quantity > 0) {
          _selectedProducts.add({
            'productId': productId,
            'quantity': quantity,
            'name': productName,
            'price': price,
          });
        }
      } else {
        if (quantity > 0) {
          _selectedProducts[existingProductIndex]['quantity'] = quantity;
        } else {
          _selectedProducts.removeAt(existingProductIndex);
        }
      }

      _calculateTotalPrice();
    });
  }

  void _calculateTotalPrice() {
    _totalPrice = _selectedProducts.fold(
      0.0,
      (sum, product) => sum + ((product['price'] as double) * (product['quantity'] as int)),
    );
  }

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
              padding: EdgeInsets.only(bottom: 80.h), // Add padding for FAB
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
                                tr('restaurant_store_details.menu.title'),
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
                        onLocationSelect: (context) async {
                          final result = await Navigator.pushNamed(
                            context,
                            Routes.deliveryOrderLocationPickerView,
                          ) as Map<String, dynamic>?;
                          
                          if (result != null) {
                            context
                                .read<CreateDeliveryOrderCubit>()
                                .selectLocation(result);
                          }
                        },
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
    return Column(
      children: restaurantData.products!
          .map((product) => ProductCard(
                product: product,
                onQuantityChanged: (quantity) {
                  _updateProductQuantity(
                    product.id ?? '',
                    product.name ?? '',
                    product.price?.toDouble() ?? 0.0,
                    quantity,
                  );
                },
              ))
          .toList(),
    );
  }

  Widget _buildFloatingActionButton() {
    return BlocConsumer<CreateDeliveryOrderCubit, CreateDeliveryOrderState>(
      listener: (context, state) {
        if (state is CreateDeliveryOrderLoading) {
          DialogHelper.showLoadingDialog(
            context: context,
            loadingMessage: tr('dialog.loading'),
          );
        } else if (state is CreateDeliveryOrderSuccess) {
          SnackBarHelper.showSuccessSnackBar(
            context,
            message: tr('success.success'),
          );
          Navigator.pop(context);
        } else if (state is CreateDeliveryOrderError) {
          Navigator.pop(context);
          SnackBarHelper.showErrorSnackBar(
            context,
            message: state.failure.errorMessage,
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<CreateDeliveryOrderCubit>();
        final restaurantData = context
                .read<RestaurantStoreDetailsCubit>()
                .state is RestaurantStoreDetailsSuccess
            ? (context.read<RestaurantStoreDetailsCubit>().state
                    as RestaurantStoreDetailsSuccess)
                .storeDetails
                .data
            : null;

        if (restaurantData == null) return const SizedBox.shrink();

        return FloatingActionButton.extended(
          onPressed: () {
            if (_selectedProducts.isEmpty) {
              SnackBarHelper.showErrorSnackBar(
                context,
                message: tr('restaurant_store_details.please_select_products'),
              );
              return;
            }

            if (_selectedPaymentMethod.isEmpty) {
              SnackBarHelper.showErrorSnackBar(
                context,
                message: tr('restaurant_store_details.please_select_payment_method'),
              );
              return;
            }

            if (cubit.selectedLocation == null) {
              SnackBarHelper.showErrorSnackBar(
                context,
                message: tr('restaurant_store_details.please_select_location'),
              );
              return;
            }

            cubit.createDeliveryOrder(
              userId: cubit.userId,
              type: "delivery",
              address: cubit.selectedLocation!['address'],
              latitude: cubit.selectedLocation!['latitude'],
              longitude: cubit.selectedLocation!['longitude'],
              price: _totalPrice,
              duration: 60,
              status: "pending",
              totalAmount: _totalPrice,
              paymentStatus: "pending",
              store: [
                {
                  "storeId": restaurantData.id,
                  "products": _selectedProducts.map((product) => {
                    "productId": product['productId'],
                    "quantity": product['quantity']
                  }).toList(),
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
                '${tr('restaurant_store_details.order.place_order')} | ${_totalPrice.toStringAsFixed(2)} ${tr('orders_tab.currency')}',
                style: AppStyles.bodyText1.copyWith(color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }
}
