import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_styles.dart';
import '../../data/models/store_details_model.dart';

class ProductCard extends StatefulWidget {
  final Products product;
  final VoidCallback onTap;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => _animationController.forward(),
      onTapUp: (_) => _animationController.reverse(),
      onTapCancel: () => _animationController.reverse(),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          );
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image with Hero animation
              Hero(
                tag: 'product_${widget.product.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    bottomLeft: Radius.circular(16.r),
                  ),
                  child: Container(
                    width: 110.w,
                    height: 110.w,
                    child: widget.product.images != null && widget.product.images!.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: widget.product.images!.first,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(color: Colors.white),
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: AppColors.lightGrey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.fastfood, size: 30.w, color: AppColors.grey),
                                SizedBox(height: 4.h),
                                Text(
                                  'No Image',
                                  style: AppStyles.caption.copyWith(color: AppColors.grey),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          fadeInDuration: Duration(milliseconds: 300),
                        )
                      : Container(
                          color: AppColors.lightGrey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.fastfood, size: 30.w, color: AppColors.grey),
                              SizedBox(height: 4.h),
                              Text(
                                'No Image',
                                style: AppStyles.caption.copyWith(color: AppColors.grey),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                  ),
                ),
              ),
              
              // Product Details
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Name
                      Text(
                        widget.product.name ?? 'Product',
                        style: AppStyles.bodyTextBold.copyWith(
                          fontSize: 16.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      
                      SizedBox(height: 6.h),
                      
                      // Product Description
                      if (widget.product.description != null && widget.product.description!.isNotEmpty)
                        Text(
                          widget.product.description!,
                          style: AppStyles.bodyText3.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        
                      SizedBox(height: 10.h),
                      
                      // Price and Add Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Price with proper formatting
                          Text(
                            '\$${_formatPrice(widget.product.price ?? 0)}',
                            style: AppStyles.bodyText2.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                              fontSize: 18.sp,
                            ),
                          ),
                          
                          // Quantity selector and Add Button
                          Row(
                            children: [
                              // Quantity selector
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.background,
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(
                                    color: AppColors.divider,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    // Decrease button
                                    InkWell(
                                      onTap: () {
                                        if (_quantity > 1) {
                                          setState(() {
                                            _quantity--;
                                          });
                                        }
                                      },
                                      borderRadius: BorderRadius.circular(8.r),
                                      child: Container(
                                        width: 28.w,
                                        height: 28.w,
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.remove,
                                          size: 16.w,
                                          color: _quantity > 1 
                                            ? AppColors.textPrimary 
                                            : AppColors.textSecondary,
                                        ),
                                      ),
                                    ),
                                    
                                    // Quantity value
                                    Container(
                                      width: 28.w,
                                      alignment: Alignment.center,
                                      child: Text(
                                        '$_quantity',
                                        style: AppStyles.bodyTextBold,
                                      ),
                                    ),
                                    
                                    // Increase button
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _quantity++;
                                        });
                                      },
                                      borderRadius: BorderRadius.circular(8.r),
                                      child: Container(
                                        width: 28.w,
                                        height: 28.w,
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.add,
                                          size: 16.w,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              
                              SizedBox(width: 8.w),
                              
                              // Add Button
                              Material(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(8.r),
                                child: InkWell(
                                  onTap: () {
                                    // Add to cart action
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Added $_quantity ${widget.product.name} to cart'),
                                        duration: Duration(seconds: 2),
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.r),
                                        ),
                                      ),
                                    );
                                  },
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 8.h,
                                    ),
                                    child: Icon(
                                      Icons.add_shopping_cart,
                                      color: Colors.white,
                                      size: 18.w,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  String _formatPrice(num price) {
    // Convert cents to dollars if needed (e.g., 899 -> 8.99)
    if (price > 100) {
      return (price / 100).toStringAsFixed(2);
    }
    return price.toStringAsFixed(2);
  }
}
