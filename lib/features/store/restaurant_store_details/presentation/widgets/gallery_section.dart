import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_styles.dart';
import 'package:shimmer/shimmer.dart';

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
                    _openGalleryViewer(context, images!, 0);
                  },
                  child: Row(
                    children: [
                      Text(
                        'View All',
                        style: AppStyles.bodyText3.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12.w,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
            ],
          ),
          
          SizedBox(height: 16.h),
          
          // Image Grid with staggered layout
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
              childAspectRatio: 1.0,
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
    return Hero(
      tag: 'gallery_image_$index',
      child: GestureDetector(
        onTap: () {
          // Open image viewer with the current index
          _openGalleryViewer(context, images!, index);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Image with enhanced loading
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: AppColors.lightGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.broken_image, size: 24.w, color: AppColors.grey),
                        SizedBox(height: 4.h),
                        Text(
                          'Image Error',
                          style: AppStyles.caption.copyWith(color: AppColors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  fadeInDuration: Duration(milliseconds: 300),
                  fadeOutDuration: Duration(milliseconds: 300),
                  memCacheWidth: (MediaQuery.of(context).size.width * 0.33 * MediaQuery.of(context).devicePixelRatio).toInt(),
                ),
                
                // Overlay for "View More"
                if (isLastWithMore)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '+$remainingCount',
                            style: AppStyles.header3.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'more photos',
                            style: AppStyles.caption.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openGalleryViewer(BuildContext context, List<String> images, int initialIndex) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GalleryViewerPage(
          images: images,
          initialIndex: initialIndex,
        ),
      ),
    );
  }
}

// Gallery Viewer Page for full-screen image viewing
class GalleryViewerPage extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const GalleryViewerPage({
    Key? key,
    required this.images,
    required this.initialIndex,
  }) : super(key: key);

  @override
  State<GalleryViewerPage> createState() => _GalleryViewerPageState();
}

class _GalleryViewerPageState extends State<GalleryViewerPage> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Gallery (${_currentIndex + 1}/${widget.images.length})',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          // Main Image Viewer
          PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Hero(
                tag: 'gallery_image_$index',
                child: InteractiveViewer(
                  minScale: 0.5,
                  maxScale: 3.0,
                  child: CachedNetworkImage(
                    imageUrl: widget.images[index],
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(color: AppColors.primary),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.broken_image, size: 50, color: Colors.white),
                          SizedBox(height: 16),
                          Text(
                            'Failed to load image',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          
          // Bottom Thumbnail Preview
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Container(
              height: 70.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: widget.images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      width: 60.w,
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _currentIndex == index ? AppColors.primary : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: CachedNetworkImage(
                          imageUrl: widget.images[index],
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[800]!,
                            highlightColor: Colors.grey[600]!,
                            child: Container(color: Colors.black),
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: Colors.grey[800],
                            child: Icon(Icons.broken_image, color: Colors.white, size: 20.w),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
