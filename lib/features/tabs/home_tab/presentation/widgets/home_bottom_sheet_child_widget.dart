import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/widgets/home_category_item.dart';

import '../../../../../core/routes/routes.dart';

class HomeBottomSheetChildWidget extends StatelessWidget {
  const HomeBottomSheetChildWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      width: double.infinity,
      child: GridView.builder(
          itemCount: 5,
          padding: EdgeInsets.all(5.r),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (context, index) {
            return HomeCategoryItem(
              title: 'title',
              image: 'assets/images/repair_and_installation.png',
              onTap: () {
                Navigator.pushNamed(context, Routes.homeServiceDetailsView);
              },
            );
          }),
    );
  }
}
