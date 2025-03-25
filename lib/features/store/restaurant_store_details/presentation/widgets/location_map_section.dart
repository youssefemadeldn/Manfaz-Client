// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../../core/theme/app_colors.dart';
// import '../../../../../../core/theme/app_styles.dart';
// import '../../data/models/store_details_model.dart';

// class LocationMapSection extends StatelessWidget {
//   final List<Locations>? locations;

//   const LocationMapSection({
//     Key? key,
//     required this.locations,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     if (locations == null || locations!.isEmpty) {
//       return SizedBox.shrink();
//     }
    
//     return Container(
//       padding: EdgeInsets.all(16.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Section Title
//           Row(
//             children: [
//               Icon(Icons.location_on, color: AppColors.primary),
//               SizedBox(width: 8.w),
//               Text(
//                 'Location',
//                 style: AppStyles.header3,
//               ),
//             ],
//           ),
          
//           SizedBox(height: 16.h),
          
//           // Map Placeholder
//           Container(
//             height: 180.h,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: AppColors.lightGrey,
//               borderRadius: BorderRadius.circular(12.r),
//               border: Border.all(color: AppColors.divider),
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(12.r),
//               child: Stack(
//                 children: [
//                   // Map Placeholder
//                   Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.map,
//                           size: 48.w,
//                           color: AppColors.grey,
//                         ),
//                         SizedBox(height: 8.h),
//                         Text(
//                           'Map View',
//                           style: AppStyles.bodyText2.copyWith(
//                             color: AppColors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
                  
//                   // Location Pin
//                   Center(
//                     child: Icon(
//                       Icons.location_pin,
//                       color: AppColors.primary,
//                       size: 36.w,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
          
//           SizedBox(height: 16.h),
          
//           // Location Details
//           ...locations!.map((location) => _buildLocationDetails(location)).toList(),
//         ],
//       ),
//     );
//   }

//   Widget _buildLocationDetails(Locations location) {
//     return Container(
//       padding: EdgeInsets.all(12.w),
//       margin: EdgeInsets.only(bottom: 8.h),
//       decoration: BoxDecoration(
//         color: AppColors.background,
//         borderRadius: BorderRadius.circular(8.r),
//         border: Border.all(color: AppColors.divider),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Location Name
//           if (location.name != null && location.name!.isNotEmpty)
//             Text(
//               location.name!,
//               style: AppStyles.bodyTextBold,
//             ),
            
//           SizedBox(height: 8.h),
          
//           // Address
//           if (location.address != null && location.address!.isNotEmpty)
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Icon(Icons.location_on, size: 16.w, color: AppColors.primary),
//                 SizedBox(width: 8.w),
//                 Expanded(
//                   child: Text(
//                     location.address!,
//                     style: AppStyles.bodyText3,
//                   ),
//                 ),
//               ],
//             ),
            
//           SizedBox(height: 8.h),
          
//           // Coordinates
//           if (location.latitude != null && location.longitude != null)
//             Row(
//               children: [
//                 Icon(Icons.gps_fixed, size: 16.w, color: AppColors.primary),
//                 SizedBox(width: 8.w),
//                 Text(
//                   'Lat: ${location.latitude}, Lng: ${location.longitude}',
//                   style: AppStyles.caption,
//                 ),
//               ],
//             ),
//         ],
//       ),
//     );
//   }
// }
