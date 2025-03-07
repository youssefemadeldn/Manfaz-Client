import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/di/di.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/widgets/states/home_tab_error.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widgets/ArrowBackIosButton.dart';
import '../controller/cubit/worker_list_cubit.dart';
import '../widgets/worker_card_item.dart';
import 'package:shimmer/shimmer.dart';

class WorkerListViewView extends StatelessWidget {
  const WorkerListViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WorkerListCubit>()..fetchWorker(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Workers',
            style: AppStyles.header1,
          ),
          leading: ArrowBackIosButton(),
        ),
        body: SafeArea(
            child: Column(
          children: [
            BlocBuilder<WorkerListCubit, WorkerListState>(
              builder: (context, state) {
                if (state is WorkerListLoading) {
                  return Expanded(
                    child: ListView.builder(

                      itemCount: 6, // Show 6 shimmer items while loading
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(color: Colors.grey[200]!),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Profile image placeholder
                                    Container(
                                      width: 80.w,
                                      height: 80.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey[200]!,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16.w),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // Name placeholder
                                          Container(
                                            height: 20.h,
                                            width: 150.w,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                          ),
                                          SizedBox(height: 8.h),
                                          // Title placeholder
                                          Container(
                                            height: 16.h,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                          ),
                                          SizedBox(height: 12.h),
                                          // Location row placeholder
                                          Row(
                                            children: [
                                              Container(
                                                height: 16.h,
                                                width: 16.w,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              SizedBox(width: 8.w),
                                              Container(
                                                height: 16.h,
                                                width: 120.w,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(4),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16.h),
                                // Description placeholder
                                Container(
                                  height: 16.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Container(
                                  height: 16.h,
                                  width: 200.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                // Skills placeholder
                                Row(
                                  children: List.generate(
                                    3,
                                    (index) => Container(
                                      margin: EdgeInsets.only(right: 8.w),
                                      height: 32.h,
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                // Bottom row placeholder
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 32.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    Container(
                                      height: 32.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } 
                else if (state is WorkerListSuccess) {
                  var workList=  state.workerListModel.data;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: workList!.length,
                      itemBuilder: (context, index) => WorkerCardItem(worker: workList[index],),
                    ),
                  );
                } else 
                if (state is WorkerListFailure) {
                  return ErrorMessageWidget(
                    errorMessage: state.failure.errorMessage,
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ],
        )),
      ),
    );
  }
}
