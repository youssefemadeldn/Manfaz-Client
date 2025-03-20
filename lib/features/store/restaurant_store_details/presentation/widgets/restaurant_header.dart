import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_styles.dart';
import '../../data/models/store_details_model.dart';

class RestaurantHeader extends StatelessWidget {
  final Data restaurantData;

  const RestaurantHeader({
    Key? key,
    required this.restaurantData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cover Image with parallax effect
        _buildCoverImage(context),
        
        // Restaurant Info
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Restaurant Name and Logo
              _buildNameAndLogo(),
              
              SizedBox(height: 12.h),
              
              // Rating and Reviews
              _buildRatingAndReviews(),
              
              SizedBox(height: 12.h),
              
              // Description
              if (restaurantData.description != null && restaurantData.description!.isNotEmpty)
                _buildExpandableDescription(),
                
              SizedBox(height: 16.h),
              
              // Contact Info
              _buildContactInfo(),
              
              SizedBox(height: 16.h),
              
              // Delivery Info
              _buildDeliveryInfo(),
            ],
          ),
        ),
        
        Divider(color: AppColors.divider, thickness: 8.h),
      ],
    );
  }

  Widget _buildCoverImage(BuildContext context) {
    return Stack(
      children: [
        // Cover Image with parallax effect
        Container(
          height: 200.h,
          width: double.infinity,
          child: restaurantData.coverImage != null && restaurantData.coverImage!.isNotEmpty
            ? ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                    stops: [0.7, 1.0],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: CachedNetworkImage(
                  imageUrl: restaurantData.coverImage!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(color: Colors.white),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: AppColors.lightGrey,
                    child: Icon(Icons.restaurant, size: 50.w, color: AppColors.grey),
                  ),
                  fadeInDuration: Duration(milliseconds: 300),
                ),
              )
            : Container(
                color: AppColors.lightGrey,
                child: Icon(Icons.restaurant, size: 50.w, color: AppColors.grey),
              ),
        ),
        
        // Gradient overlay for better text visibility
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.transparent,
                  Colors.black.withOpacity(0.4),
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          ),
        ),
        
        // Back Button with improved design
        Positioned(
          top: 16.w,
          left: 16.w,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12.r),
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Icon(Icons.arrow_back, color: AppColors.primary),
                ),
              ),
            ),
          ),
        ),
        
        // Share Button
        Positioned(
          top: 16.w,
          right: 16.w,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12.r),
                onTap: () {
                  // Share restaurant
                },
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Icon(Icons.share, color: AppColors.primary),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNameAndLogo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Restaurant Logo with enhanced design
        if (restaurantData.logo != null && restaurantData.logo!.isNotEmpty)
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                imageUrl: restaurantData.logo!,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(color: Colors.white),
                ),
                errorWidget: (context, url, error) => Container(
                  color: AppColors.lightGrey,
                  child: Icon(Icons.restaurant, size: 30.w, color: AppColors.grey),
                ),
                fadeInDuration: Duration(milliseconds: 300),
              ),
            ),
          ),
          
        SizedBox(width: 16.w),
        
        // Restaurant Name and Status
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurantData.name ?? 'Restaurant',
                style: AppStyles.header2.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              SizedBox(height: 8.h),
              
              // Status Chip with improved design
              if (restaurantData.status != null)
                Row(
                  children: [
                    Container(
                      width: 10.w,
                      height: 10.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: restaurantData.status?.toLowerCase() == 'open' 
                          ? AppColors.success 
                          : AppColors.error,
                        boxShadow: [
                          BoxShadow(
                            color: (restaurantData.status?.toLowerCase() == 'open' 
                              ? AppColors.success 
                              : AppColors.error).withOpacity(0.4),
                            blurRadius: 6,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: restaurantData.status?.toLowerCase() == 'open' 
                          ? AppColors.success.withOpacity(0.15) 
                          : AppColors.error.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        restaurantData.status ?? '',
                        style: AppStyles.caption.copyWith(
                          color: restaurantData.status?.toLowerCase() == 'open' 
                            ? AppColors.success 
                            : AppColors.error,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRatingAndReviews() {
    return Row(
      children: [
        // Rating Stars with actual rating bar
        RatingBar.builder(
          initialRating: restaurantData.rating?.toDouble() ?? 0.0,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 18.w,
          ignoreGestures: true,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: AppColors.secondary,
          ),
          unratedColor: AppColors.lightGrey,
          onRatingUpdate: (_) {},
        ),
        
        SizedBox(width: 8.w),
        
        // Rating value
        Text(
          '${restaurantData.rating ?? 0}',
          style: AppStyles.bodyText2.copyWith(fontWeight: FontWeight.bold),
        ),
        
        SizedBox(width: 16.w),
        
        // Reviews Count with icon
        Row(
          children: [
            Icon(Icons.comment, size: 16.w, color: AppColors.textSecondary),
            SizedBox(width: 4.w),
            Text(
              '${restaurantData.reviewsCount ?? 0} Reviews',
              style: AppStyles.bodyText3,
            ),
          ],
        ),
        
        Spacer(),
        
        // Category with improved design
        if (restaurantData.category != null && restaurantData.category!.name != null)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withOpacity(0.15),
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.restaurant,
                  size: 14.w,
                  color: AppColors.primary,
                ),
                SizedBox(width: 4.w),
                Text(
                  restaurantData.category!.name!,
                  style: AppStyles.caption.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildExpandableDescription() {
    return ExpandableText(
      text: restaurantData.description!,
      style: AppStyles.bodyText2,
      maxLines: 2,
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (restaurantData.address != null && restaurantData.address!.isNotEmpty)
          _buildInfoRow(
            icon: Icons.location_on,
            text: restaurantData.address!,
            onTap: () {
              // Open map with location
            },
          ),
          
        SizedBox(height: 8.h),
        
        if (restaurantData.phone != null && restaurantData.phone!.isNotEmpty)
          _buildInfoRow(
            icon: Icons.phone,
            text: restaurantData.phone!,
            onTap: () {
              // Call restaurant
            },
          ),
          
        SizedBox(height: 8.h),
        
        if (restaurantData.email != null && restaurantData.email!.isNotEmpty)
          _buildInfoRow(
            icon: Icons.email,
            text: restaurantData.email!,
            onTap: () {
              // Email restaurant
            },
          ),
      ],
    );
  }

  Widget _buildDeliveryInfo() {
    return Row(
      children: [
        // Min Order Amount
        if (restaurantData.minOrderAmount != null)
          Expanded(
            child: _buildInfoCard(
              icon: Icons.shopping_bag,
              title: 'Min Order',
              value: '\$${_formatPrice(restaurantData.minOrderAmount!)}',
            ),
          ),
          
        SizedBox(width: 12.w),
        
        // Delivery Fee
        if (restaurantData.deliveryFee != null)
          Expanded(
            child: _buildInfoCard(
              icon: Icons.delivery_dining,
              title: 'Delivery Fee',
              value: '\$${_formatPrice(restaurantData.deliveryFee!)}',
            ),
          ),
      ],
    );
  }

  Widget _buildInfoRow({
    required IconData icon, 
    required String text,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                color: AppColors.primaryLight.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(icon, size: 18.w, color: AppColors.primary),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: AppStyles.bodyText3,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (onTap != null)
                    Text(
                      icon == Icons.location_on
                          ? 'View on map'
                          : icon == Icons.phone
                              ? 'Call now'
                              : 'Send email',
                      style: AppStyles.caption.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            ),
            if (onTap != null)
              Icon(
                Icons.arrow_forward_ios,
                size: 14.w,
                color: AppColors.textSecondary,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.divider),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 24.w, color: AppColors.primary),
          ),
          SizedBox(height: 12.h),
          Text(title, style: AppStyles.caption),
          SizedBox(height: 4.h),
          Text(
            value,
            style: AppStyles.bodyText2.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
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

// Expandable Text Widget
class ExpandableText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final int maxLines;

  const ExpandableText({
    Key? key,
    required this.text,
    required this.style,
    this.maxLines = 3,
  }) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          firstChild: Text(
            widget.text,
            style: widget.style,
            maxLines: widget.maxLines,
            overflow: TextOverflow.ellipsis,
          ),
          secondChild: Text(
            widget.text,
            style: widget.style,
          ),
          crossFadeState: _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: Duration(milliseconds: 200),
        ),
        if (widget.text.length > 100) // Only show if text is long enough
          GestureDetector(
            onTap: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Row(
                children: [
                  Text(
                    _expanded ? 'Show less' : 'Read more',
                    style: AppStyles.caption.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(
                    _expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    size: 14.w,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
