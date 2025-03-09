import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

class CreateServiceOrderView extends StatefulWidget {
  const CreateServiceOrderView({super.key});

  @override
  State<CreateServiceOrderView> createState() => _CreateServiceOrderViewState();
}

class _CreateServiceOrderViewState extends State<CreateServiceOrderView> {
  String? selectedPaymentMethod;
  final List<String> paymentMethods = [
    'Cash',
    'Credit Card',
    'Tamara',
    'Tabby'
  ];

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h, top: 8.h),
      child: Text(
        title,
        style: AppStyles.header3.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    ).animate().fadeIn(delay: 200.ms);
  }

  Widget _buildLocationTile(
      String title, String hint, IconData icon, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        leading: Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: AppStyles.bodyText2.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          hint,
          style: AppStyles.bodyText2.copyWith(
            color: AppColors.grey,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColors.grey,
          size: 16.sp,
        ),
        onTap: () {
          // TODO: Implement location selection
        },
      ),
    ).animate().fadeIn(delay: 300.ms).slideX();
  }

  Widget _buildTextField(String hint, int maxLines) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppStyles.bodyText2.copyWith(
            color: AppColors.textSecondary.withOpacity(0.7),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: AppColors.divider,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: AppColors.divider,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: AppColors.surface,
          contentPadding: EdgeInsets.all(16.w),
        ),
        style: AppStyles.bodyText2.copyWith(
          color: AppColors.textPrimary,
        ),
      ),
    ).animate().fadeIn(delay: 400.ms).slideY();
  }

  Widget _buildPriceInfo() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.receipt_outlined,
                  color: AppColors.primary,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                'Price Details',
                style: AppStyles.header3.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildPriceRow('Service Price', '150 SAR'),
          _buildPriceRow('Duration', '2 hours'),
          Divider(height: 32.h, thickness: 1),
          _buildPriceRow('Total Amount', '150 SAR', isTotal: true),
        ],
      ),
    ).animate().fadeIn(delay: 500.ms).scale();
  }

  Widget _buildPriceRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isTotal
                ? AppStyles.subtitle1.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  )
                : AppStyles.bodyText2.copyWith(
                    color: AppColors.grey,
                    fontSize: 15.sp,
                  ),
          ),
          Text(
            value,
            style: isTotal
                ? AppStyles.subtitle1.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: AppColors.primary,
                  )
                : AppStyles.bodyText2.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Payment Method'),
        Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: paymentMethods.map((method) {
            final isSelected = selectedPaymentMethod == method;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedPaymentMethod = method;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getPaymentIcon(method),
                      color: isSelected ? Colors.white : AppColors.grey,
                      size: 20.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      method,
                      style: AppStyles.bodyText2.copyWith(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            )
                .animate()
                .fadeIn(delay: (600 + paymentMethods.indexOf(method) * 100).ms)
                .scale();
          }).toList(),
        ),
      ],
    );
  }

  IconData _getPaymentIcon(String method) {
    switch (method.toLowerCase()) {
      case 'cash':
        return Icons.money;
      case 'credit card':
        return Icons.credit_card;
      case 'tamara':
        return Icons.account_balance_wallet;
      case 'tabby':
        return Icons.payment;
      default:
        return Icons.payment;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // SliverAppBar(
              //   expandedHeight: 300.h,
              //   pinned: true,
              //   backgroundColor: AppColors.primary,
              //   leading: IconButton(
              //     icon: Container(
              //       padding: EdgeInsets.all(8.w),
              //       decoration: BoxDecoration(
              //         color: AppColors.white.withOpacity(0.2),
              //         shape: BoxShape.circle,
              //       ),
              //       child: const Icon(Icons.arrow_back_ios,
              //           color: AppColors.white, size: 20),
              //     ),
              //     onPressed: () => Navigator.pop(context),
              //   ).animate().fadeIn(delay: 300.ms).slideX(),
              //   flexibleSpace: FlexibleSpaceBar(
              //     background: Stack(
              //       fit: StackFit.expand,
              //       children: [
              //         Image.network(
              //           'https://img.freepik.com/free-photo/young-handsome-man-choosing-clothes-shop_1303-19720.jpg',
              //           fit: BoxFit.cover,
              //         ).animate().fadeIn(duration: 800.ms),
              //         Container(
              //           decoration: BoxDecoration(
              //             gradient: LinearGradient(
              //               begin: Alignment.topCenter,
              //               end: Alignment.bottomCenter,
              //               colors: [
              //                 Colors.transparent,
              //                 Colors.black.withOpacity(0.6),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SliverToBoxAdapter(
                child: Transform.translate(
                  offset: Offset(0, -20.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.r),
                        topRight: Radius.circular(24.r),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 16.w, right: 16.w, top: 80.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20.w),
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              borderRadius: BorderRadius.circular(16.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 80.w,
                                  height: 80.w,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.primary,
                                        AppColors.primary.withOpacity(0.8),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            AppColors.primary.withOpacity(0.3),
                                        blurRadius: 15,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.cleaning_services_rounded,
                                    color: Colors.white,
                                    size: 35.w,
                                  ),
                                ).animate().scale(delay: 200.ms),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Service Order",
                                        style: AppStyles.header2.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                          .animate()
                                          .fadeIn(delay: 300.ms)
                                          .slideX(),
                                      SizedBox(height: 6.h),
                                      Text(
                                        "Create your service request with detailed instructions",
                                        style: AppStyles.bodyText2.copyWith(
                                          color: AppColors.grey,
                                          height: 1.4,
                                        ),
                                      )
                                          .animate()
                                          .fadeIn(delay: 400.ms)
                                          .slideX(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24.h),
                          _buildSectionTitle('Location'),
                          _buildLocationTile(
                            'Service Location',
                            'Select service location',
                            Icons.location_on_rounded,
                            AppColors.primary,
                          ),
                          SizedBox(height: 24.h),
                          _buildSectionTitle('Description'),
                          _buildTextField(
                              'Describe your service request...', 3),
                          SizedBox(height: 24.h),
                          _buildSectionTitle('Additional Notes'),
                          _buildTextField('Add any additional notes...', 2),
                          SizedBox(height: 32.h),
                          _buildPriceInfo(),
                          SizedBox(height: 32.h),
                          _buildPaymentMethods(),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).padding.bottom + 80.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement order creation
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "Create Order",
                    style: AppStyles.buttonText.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
            ),
          ).animate().fadeIn(delay: 1200.ms).slideY(begin: 1, end: 0),
        ],
      ),
    );
  }
}
