import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../services_list_view_view/data/model/parameters_services_list_model.dart';

class ServiceDetailsView extends StatelessWidget {
  final ParametersServiceDetailsModel parametersServiceDetailsModel;

  const ServiceDetailsView({
    super.key,
    required this.parametersServiceDetailsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Service Image Header
          SliverAppBar(
            expandedHeight: 300.h,
            pinned: true,
            backgroundColor: AppColors.primary,
            leading: IconButton(
              icon: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_back_ios,
                    color: AppColors.primary, size: 16.w),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: parametersServiceDetailsModel.imageUrl ?? '',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[300],
                      child: Center(
                        child:
                            CircularProgressIndicator(color: AppColors.primary),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[300],
                      child: Icon(Icons.error, color: Colors.grey[500]),
                    ),
                  ),
                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                        stops: const [0.6, 1.0],
                      ),
                    ),
                  ),
                  // Status badge
                  if (parametersServiceDetailsModel.status != null)
                    Positioned(
                      bottom: 16.h,
                      right: 16.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8.w,
                              height: 8.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: parametersServiceDetailsModel.status
                                            ?.toLowerCase() ==
                                        'active'
                                    ? Colors.green
                                    : parametersServiceDetailsModel.status
                                                ?.toLowerCase() ==
                                            'pending'
                                        ? Colors.orange
                                        : AppColors.primary,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              parametersServiceDetailsModel.status!,
                              style: AppStyles.bodyText2.copyWith(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
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

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Service Header Section
                Container(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (parametersServiceDetailsModel.iconUrl != null)
                            Container(
                              // padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                // color: AppColors.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    parametersServiceDetailsModel.iconUrl!,
                                height: 70.h,
                                width: 70.h,
                                placeholder: (context, url) => SizedBox(
                                  height: 40.h,
                                  width: 40.h,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: AppColors.primary,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error, color: AppColors.primary),
                              ),
                            ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              parametersServiceDetailsModel.name ?? '',
                              style: AppStyles.header1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),

                      // Rating Section
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: (parametersServiceDetailsModel.rating ?? 0)
                                .toDouble(),
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 20.w,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '${parametersServiceDetailsModel.rating}/5',
                            style: AppStyles.bodyText1.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ' (${parametersServiceDetailsModel.ratingCount} Reviews)',
                            style: AppStyles.bodyText2.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Quick Info Cards
                Container(
                  height: 100.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildQuickInfoCard(
                        icon: Icons.timer,
                        title: 'Duration',
                        value:
                            "${parametersServiceDetailsModel.duration} Minutes",
                      ),
                      _buildQuickInfoCard(
                        icon: parametersServiceDetailsModel.availability == true
                            ? Icons.check_circle
                            : Icons.cancel,
                        title: 'Availability',
                        value:
                            parametersServiceDetailsModel.availability == true
                                ? 'Available'
                                : 'Unavailable',
                        valueColor:
                            parametersServiceDetailsModel.availability == true
                                ? Colors.green
                                : Colors.red,
                      ),
                      if (parametersServiceDetailsModel.warranty != null)
                        _buildQuickInfoCard(
                          icon: Icons.verified_user,
                          title: 'Warranty',
                          value:
                              "${parametersServiceDetailsModel.warranty} Months",
                          valueColor: AppColors.primary,
                        ),
                    ],
                  ),
                ),

                // Price Section
                Container(
                  margin: EdgeInsets.all(16.w),
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price Details',
                        style: AppStyles.header2,
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price',
                            style: AppStyles.bodyText1,
                          ),
                          Text(
                            "\$${parametersServiceDetailsModel.price?.toStringAsFixed(2)}",
                            style: AppStyles.priceTag.copyWith(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      if (parametersServiceDetailsModel.installmentAvailable ==
                          true) ...[
                        Divider(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Monthly Installment',
                                  style: AppStyles.bodyText1,
                                ),
                                Text(
                                  "For ${parametersServiceDetailsModel.installmentMonths} Months",
                                  style: AppStyles.bodyText2.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "\$${parametersServiceDetailsModel.monthlyInstallment?.toStringAsFixed(2)}",
                              style: AppStyles.priceTag.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),

                // Description
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: AppStyles.header2,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        parametersServiceDetailsModel.description ?? '',
                        style: AppStyles.bodyText1.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                // What's Included
                if (parametersServiceDetailsModel.whatIncluded?.isNotEmpty ==
                    true) ...[
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What\'s Included',
                          style: AppStyles.header2,
                        ),
                        SizedBox(height: 16.h),
                        ...parametersServiceDetailsModel.whatIncluded!
                            .map((item) => Padding(
                                  padding: EdgeInsets.only(bottom: 12.h),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(4.w),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary
                                              .withOpacity(0.1),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: AppColors.primary,
                                          size: 16.w,
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Expanded(
                                        child: Text(
                                          item,
                                          style: AppStyles.bodyText1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ],
                    ),
                  ),
                ],

                // FAQs
                if (parametersServiceDetailsModel.faqs?.isNotEmpty == true) ...[
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.question_answer_outlined,
                                color: AppColors.primary),
                            SizedBox(width: 8.w),
                            Text(
                              'Frequently Asked Questions',
                              style: AppStyles.header2,
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        ...parametersServiceDetailsModel.faqs!
                            .map(
                              (faq) => Container(
                                margin: EdgeInsets.only(bottom: 12.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade100,
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    dividerColor: Colors.transparent,
                                    colorScheme: ColorScheme.light(
                                      primary: AppColors.primary,
                                    ),
                                  ),
                                  child: ExpansionTile(
                                    tilePadding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 8.h,
                                    ),
                                    leading: Icon(
                                      Icons.help_outline_rounded,
                                      color: AppColors.primary,
                                      size: 24.w,
                                    ),
                                    title: Text(
                                      faq.question ?? '',
                                      style: AppStyles.bodyText1.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 20.w,
                                          right: 20.w,
                                          bottom: 20.h,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.subdirectory_arrow_right,
                                              color: AppColors.textSecondary,
                                              size: 20.w,
                                            ),
                                            SizedBox(width: 8.w),
                                            Expanded(
                                              child: Text(
                                                faq.answer ?? '',
                                                style: AppStyles.bodyText1
                                                    .copyWith(
                                                  color:
                                                      AppColors.textSecondary,
                                                  height: 1.5,
                                                  fontSize: 15.sp,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                ],

                //   // Created & Updated Info
                //   if (parametersServiceDetailsModel.createdAt != null ||
                //       parametersServiceDetailsModel.updatedAt != null) ...[
                //     SizedBox(height: 24.h),
                //     Container(
                //       margin: EdgeInsets.all(16.w),
                //       padding: EdgeInsets.all(16.w),
                //       decoration: BoxDecoration(
                //         color: Colors.grey.shade50,
                //         borderRadius: BorderRadius.circular(16),
                //         border: Border.all(
                //           color: Colors.grey.shade200,
                //           width: 1,
                //         ),
                //       ),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             'Service Information',
                //             style: AppStyles.bodyText1.copyWith(
                //               fontWeight: FontWeight.w600,
                //               color: AppColors.primary,
                //             ),
                //           ),
                //           SizedBox(height: 8.h),
                //           if (parametersServiceDetailsModel.createdAt != null)
                //             Row(
                //               children: [
                //                 Icon(
                //                   Icons.calendar_today_outlined,
                //                   size: 16.w,
                //                   color: AppColors.textSecondary,
                //                 ),
                //                 SizedBox(width: 8.w),
                //                 Text(
                //                   "Created: ${parametersServiceDetailsModel.createdAt}",
                //                   style: AppStyles.bodyText2.copyWith(
                //                     color: AppColors.textSecondary,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           if (parametersServiceDetailsModel.updatedAt != null)
                //             Padding(
                //               padding: EdgeInsets.only(top: 4.h),
                //               child: Row(
                //                 children: [
                //                   Icon(
                //                     Icons.update_outlined,
                //                     size: 16.w,
                //                     color: AppColors.textSecondary,
                //                   ),
                //                   SizedBox(width: 8.w),
                //                   Text(
                //                     "Updated: ${parametersServiceDetailsModel.updatedAt}",
                //                     style: AppStyles.bodyText2.copyWith(
                //                       color: AppColors.textSecondary,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //         ],
                //       ),
                //     ),
                //   ],

                SizedBox(height: 100.h), // Bottom padding for floating button
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        width: double.infinity,
        child: FloatingActionButton.extended(
          onPressed: parametersServiceDetailsModel.availability == true
              ? () {
                  Navigator.pushNamed(context, Routes.workerListViewView);
                }
              : null,
          backgroundColor: parametersServiceDetailsModel.availability == true
              ? AppColors.primary
              : Colors.grey,
          label: Text(
            parametersServiceDetailsModel.availability == true
                ? "Find Worker"
                : 'Unavailable',
            style: AppStyles.buttonText.copyWith(color: Colors.white),
          ),
          isExtended: true,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildQuickInfoCard({
    required IconData icon,
    required String title,
    required String value,
    Color? valueColor,
  }) {
    return Container(
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: AppColors.primary),
          SizedBox(height: 4.h),
          Text(
            title,
            style: AppStyles.bodyText2.copyWith(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            value,
            style: AppStyles.bodyText1.copyWith(
              fontWeight: FontWeight.w600,
              color: valueColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
