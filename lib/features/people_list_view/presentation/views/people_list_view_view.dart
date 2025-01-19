import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_styles.dart';
import '../widgets/freelancer_card_item.dart';

class PeopleListViewView extends StatelessWidget {
  const PeopleListViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'People',
          style: AppStyles.header1,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => FreelancerCardItem(),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
