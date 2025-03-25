import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:easy_localization/easy_localization.dart';
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
    return SizedBox(
      height: 220.h,  
      child: Stack(
        children: [
          // Cover Image
          Positioned.fill(
            child: restaurantData.coverImage != null && restaurantData.coverImage!.isNotEmpty
              ? Hero(
                  tag: 'restaurant_cover_${restaurantData.id}',
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
                  ),
                )
              : Container(
                  color: AppColors.lightGrey,
                  child: Icon(Icons.restaurant, size: 50.w, color: AppColors.grey),
                ),
          ),
          
          // Gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                  stops: const [0.5, 1.0],
                ),
              ),
            ),
          ),

          // Back button with semi-transparent background
          Positioned(
            top: 16.h,
            left: 16.w,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameAndLogo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Restaurant Logo
        if (restaurantData.logo != null && restaurantData.logo!.isNotEmpty)
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
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
                  child: Icon(Icons.store, size: 30.w, color: AppColors.grey),
                ),
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
                restaurantData.name ?? tr('restaurant_store_details.unnamed'),
                style: AppStyles.header2.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: restaurantData.isActive == true 
                    ? Colors.green.withOpacity(0.1)
                    : Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  restaurantData.isActive == true
                    ? tr('restaurant_store_details.header.open')
                    : tr('restaurant_store_details.header.closed'),
                  style: AppStyles.caption.copyWith(
                    color: restaurantData.isActive == true 
                      ? Colors.green
                      : Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
        RatingBar.builder(
          initialRating: (restaurantData.rating ?? 0).toDouble(),
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 20.0,
          ignoreGestures: true,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (_) {},
        ),
        SizedBox(width: 8.w),
        Text(
          '${restaurantData.reviewsCount} ${'restaurant_store_details.header.reviews'.tr()}',
          style: AppStyles.bodyText2.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }

  Widget _buildExpandableDescription() {
    return ExpandableText(
      text: restaurantData.description!,
      maxLines: 3,
      expandText: 'restaurant_store_details.header.read_more'.tr(),
      collapseText: 'restaurant_store_details.header.read_less'.tr(),
      style: AppStyles.bodyText2,
      expandTextStyle: AppStyles.bodyText1.copyWith(color: AppColors.primary),
      collapseTextStyle: AppStyles.bodyText1.copyWith(color: AppColors.primary),
    );
  }
  Widget _buildDeliveryInfo() {
    return Row(
      children: [

        // Delivery Fee
        if (restaurantData.deliveryFee != null)
          Expanded(
            child: _buildInfoCard(
              icon: Icons.delivery_dining,
              title: 'restaurant_store_details.header.delivery_fee'.tr(),
              value: '\$${_formatPrice(restaurantData.deliveryFee!)}',
            ),
          ),
      ],
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
  final String expandText;
  final String collapseText;
  final TextStyle expandTextStyle;
  final TextStyle collapseTextStyle;

  const ExpandableText({
    Key? key,
    required this.text,
    required this.style,
    this.maxLines = 3,
    required this.expandText,
    required this.collapseText,
    required this.expandTextStyle,
    required this.collapseTextStyle,
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
                    _expanded ? widget.collapseText : widget.expandText,
                    style: _expanded ? widget.collapseTextStyle : widget.expandTextStyle,
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
