import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../data/models/store_details_model.dart';
import '../widgets/restaurant_header.dart';
import '../widgets/menu_categories_tab.dart';
import '../widgets/product_card.dart';
import '../widgets/working_hours_section.dart';
import '../widgets/location_map_section.dart';
import '../widgets/gallery_section.dart';

class RestaurantStoreDetailsView extends StatefulWidget {
  final String? storeId;
  
  const RestaurantStoreDetailsView({
    super.key,
    this.storeId,
  });

  @override
  State<RestaurantStoreDetailsView> createState() => _RestaurantStoreDetailsViewState();
}

class _RestaurantStoreDetailsViewState extends State<RestaurantStoreDetailsView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedCategoryIndex = 0;
  
  // Mock data for UI demonstration
  final StoreDetailsModel mockStoreDetails = StoreDetailsModel(
    status: true,
    message: "Success",
    code: 200,
    data: Data(
      id: "1",
      name: "Delicious Restaurant",
      description: "A wonderful restaurant with a variety of delicious meals and excellent service.",
      type: "restaurant",
      logo: "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&w=1000&q=80",
      coverImage: "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&w=1000&q=80",
      images: [
        "https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&w=1000&q=80",
        "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&w=1000&q=80",
        "https://images.unsplash.com/photo-1552566626-52f8b828add9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&w=1000&q=80",
        "https://images.unsplash.com/photo-1537047902294-62a40c20a6ae?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&w=1000&q=80",
        "https://images.unsplash.com/photo-1555396273-367ea4eb4db5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&w=1000&q=80",
        "https://images.unsplash.com/photo-1544148103-0773bf10d330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&w=1000&q=80",
        "https://images.unsplash.com/photo-1578474846511-04ba529f0b88?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&w=1000&q=80",
      ],
      address: "123 Main Street, City Center, Country",
      phone: "+1 234 567 890",
      email: "info@deliciousrestaurant.com",
      categoryId: "1",
      rating: 4,
      reviewsCount: 256,
      isActive: true,
      status: "Open",
      minOrderAmount: 10,
      deliveryFee: 2,
      priceDriver: 5.0,
      categories: [
        Categories(
          id: "1",
          name: "Appetizers",
          description: "Starters and small dishes",
          images: ["https://images.unsplash.com/photo-1546241072-48010ad2862c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXBwZXRpemVyfGVufDB8fDB8fA%3D%3D&w=1000&q=80"],
        ),
        Categories(
          id: "2",
          name: "Main Course",
          description: "Main dishes",
          images: ["https://images.unsplash.com/photo-1544025162-d76694265947?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZGlubmVyfGVufDB8fDB8fA%3D%3D&w=1000&q=80"],
        ),
        Categories(
          id: "3",
          name: "Desserts",
          description: "Sweet treats",
          images: ["https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZGVzc2VydHxlbnwwfHwwfHw%3D&w=1000&q=80"],
        ),
        Categories(
          id: "4",
          name: "Drinks",
          description: "Beverages",
          images: ["https://images.unsplash.com/photo-1544145945-f90425340c7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZHJpbmtzfGVufDB8fDB8fA%3D%3D&w=1000&q=80"],
        ),
      ],
      products: [
        Products(
          id: "1",
          name: "Caesar Salad",
          description: "Fresh romaine lettuce with Caesar dressing, croutons, and parmesan cheese",
          price: 899,
          images: ["https://images.unsplash.com/photo-1546793665-c74683f339c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2FsYWR8ZW58MHx8MHx8&w=1000&q=80"],
          categoryId: "1",
        ),
        Products(
          id: "2",
          name: "Garlic Bread",
          description: "Freshly baked bread with garlic butter and herbs",
          price: 499,
          images: ["https://images.unsplash.com/photo-1619535860434-cf9b902a0a14?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Z2FybGljJTIwYnJlYWR8ZW58MHx8MHx8&w=1000&q=80"],
          categoryId: "1",
        ),
        Products(
          id: "3",
          name: "Grilled Salmon",
          description: "Fresh salmon fillet grilled to perfection, served with vegetables",
          price: 1899,
          images: ["https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2FsbW9ufGVufDB8fDB8fA%3D%3D&w=1000&q=80"],
          categoryId: "2",
        ),
        Products(
          id: "4",
          name: "Beef Steak",
          description: "Premium beef steak cooked to your preference",
          price: 2499,
          images: ["https://images.unsplash.com/photo-1558030006-450675393462?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmVlZiUyMHN0ZWFrfGVufDB8fDB8fA%3D%3D&w=1000&q=80"],
          categoryId: "2",
        ),
        Products(
          id: "5",
          name: "Chocolate Cake",
          description: "Rich chocolate cake with chocolate ganache",
          price: 699,
          images: ["https://images.unsplash.com/photo-1578985545062-69928b1d9587?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y2hvY29sYXRlJTIwY2FrZXxlbnwwfHwwfHw%3D&w=1000&q=80"],
          categoryId: "3",
        ),
        Products(
          id: "6",
          name: "Fresh Juice",
          description: "Freshly squeezed fruit juice",
          price: 399,
          images: ["https://images.unsplash.com/photo-1613478223719-2ab802602423?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZnJ1aXQlMjBqdWljZXxlbnwwfHwwfHw%3D&w=1000&q=80"],
          categoryId: "4",
        ),
      ],
      locations: [
        Locations(
          id: "1",
          name: "Main Branch",
          address: "123 Main Street, City Center, Country",
          latitude: 37.7749,
          longitude: -122.4194,
        ),
      ],
      workingHours: [
        WorkingHours(
          id: "1",
          dayOfWeek: 1,
          openTime: "09:00 AM",
          closeTime: "10:00 PM",
          isOpen: true,
        ),
        WorkingHours(
          id: "2",
          dayOfWeek: 2,
          openTime: "09:00 AM",
          closeTime: "10:00 PM",
          isOpen: true,
        ),
        WorkingHours(
          id: "3",
          dayOfWeek: 3,
          openTime: "09:00 AM",
          closeTime: "10:00 PM",
          isOpen: true,
        ),
        WorkingHours(
          id: "4",
          dayOfWeek: 4,
          openTime: "09:00 AM",
          closeTime: "10:00 PM",
          isOpen: true,
        ),
        WorkingHours(
          id: "5",
          dayOfWeek: 5,
          openTime: "09:00 AM",
          closeTime: "11:00 PM",
          isOpen: true,
        ),
        WorkingHours(
          id: "6",
          dayOfWeek: 6,
          openTime: "10:00 AM",
          closeTime: "11:00 PM",
          isOpen: true,
        ),
        WorkingHours(
          id: "7",
          dayOfWeek: 7,
          openTime: "10:00 AM",
          closeTime: "10:00 PM",
          isOpen: true,
        ),
      ],
      category: Category(
        id: "1",
        name: "Restaurants",
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    
    // Initialize tab controller with the number of categories
    final categoriesCount = mockStoreDetails.data?.categories?.length ?? 0;
    _tabController = TabController(
      length: categoriesCount,
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

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _buildContent(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildContent() {
    // In a real app, you would check if data is loading or if there's an error
    // For now, we'll just use the mock data
    final restaurantData = mockStoreDetails.data;
    
    if (restaurantData == null) {
      return Center(
        child: Text(
          'No restaurant data available',
          style: AppStyles.bodyText2,
        ),
      );
    }
    
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Restaurant Header (Cover Image, Logo, Name, Rating, etc.)
            RestaurantHeader(restaurantData: restaurantData),
            
            // Menu Categories Tabs
            if (restaurantData.categories != null && restaurantData.categories!.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Menu Title
                    Row(
                      children: [
                        Icon(Icons.restaurant_menu, color: AppColors.primary),
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
            if (restaurantData.products != null && restaurantData.products!.isNotEmpty)
              _buildProductsList(restaurantData),
              
            SizedBox(height: 16.h),
            
            // Divider
            Divider(color: AppColors.divider, thickness: 8.h),
            
            // Gallery Section
            if (restaurantData.images != null && restaurantData.images!.isNotEmpty)
              GallerySection(images: restaurantData.images),
              
            // Divider
            Divider(color: AppColors.divider, thickness: 8.h),
            
            // Working Hours Section
            if (restaurantData.workingHours != null && restaurantData.workingHours!.isNotEmpty)
              WorkingHoursSection(workingHours: restaurantData.workingHours!),
              
            // Divider
            Divider(color: AppColors.divider, thickness: 8.h),
            
            // Location Map Section
            if (restaurantData.locations != null && restaurantData.locations!.isNotEmpty)
              LocationMapSection(locations: restaurantData.locations),
              
            // Bottom Padding
            SizedBox(height: 80.h), // Extra space for the floating action button
          ],
        ),
      ),
    );
  }

  Widget _buildProductsList(Data restaurantData) {
    final categories = restaurantData.categories;
    final products = restaurantData.products;
    
    if (categories == null || products == null || categories.isEmpty || products.isEmpty) {
      return SizedBox.shrink();
    }
    
    // Filter products by the selected category
    final selectedCategoryId = categories[_selectedCategoryIndex].id;
    final categoryProducts = products.where(
      (product) => product.categoryId == selectedCategoryId
    ).toList();
    
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
        children: categoryProducts.map((product) => 
          ProductCard(
            product: product,
            onTap: () {
              // Product details action
            },
          )
        ).toList(),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        // Cart action
      },
      backgroundColor: AppColors.primary,
      icon: Icon(Icons.shopping_cart,
      color: AppColors.white,
      ),
      label: Text('Cart'),
    );
  }
}
