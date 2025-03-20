import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_styles.dart';

class GallerySection extends StatelessWidget {
  final List<String>? images;

  const GallerySection({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (images == null || images!.isEmpty) {
      return SizedBox.shrink();
    }
    
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Row(
            children: [
              Icon(Icons.photo_library, color: AppColors.primary),
              SizedBox(width: 8.w),
              Text(
                'Gallery',
                style: AppStyles.header3,
              ),
              
              Spacer(),
              
              // View All Button
              if (images!.length > 6)
                TextButton(
                  onPressed: () {
                    // View all images action
                  },
                  child: Text(
                    'View All',
                    style: AppStyles.bodyText3.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          
          SizedBox(height: 16.h),
          
          // Image Grid
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
            ),
            itemCount: images!.length > 6 ? 6 : images!.length,
            itemBuilder: (context, index) {
              return _buildGalleryItem(
                context,
                images![index],
                index,
                images!.length > 6 && index == 5,
                images!.length - 6,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryItem(
    BuildContext context,
    String imageUrl,
    int index,
    bool isLastWithMore,
    int remainingCount,
  ) {
    return GestureDetector(
      onTap: () {
        // Open image viewer
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Image
              CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: AppColors.lightGrey,
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: AppColors.lightGrey,
                  child: Icon(Icons.image, size: 30.w, color: AppColors.grey),
                ),
              ),
              
              // Overlay for "View More"
              if (isLastWithMore)
                Container(
                  color: Colors.black.withOpacity(0.7),
                  child: Center(
                    child: Text(
                      '+$remainingCount',
                      style: AppStyles.header3.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
