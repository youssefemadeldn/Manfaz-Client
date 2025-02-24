import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../tabs/home_tab/data/models/home_tab_model.dart';
import '../widgets/choose_your_service.dart';
import '../widgets/service_poster_details.dart';

class ServicesListViewView extends StatelessWidget {
  const ServicesListViewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(tr('ServicesListViewView.paints'),
            style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 12),
              height: 200,
              child: Center(
                child: Image.asset(
                  'assets/images/resized_services.png',
                ),
              ),
            ),
            ChooseYourService(),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ServicePosterDetails( 
                  availability: true,
                  categoryModel: CategoryModel(
                    id: index.toString(),  
                    // availability: true,
                    imageUrl: 'https://img.freepik.com/free-photo/professional-washer-blue-uniform-washing-luxury-car-with-water-gun-open-air-car-wash_496169-333.jpg?t=st=1740406463~exp=1740410063~hmac=f3f9793ab3c1aa4d3c586cba0f931daea9f9ac8cc67721b40ea96bd3b12a044e&w=1380',
                    description: 'anxjks sbcjlkc nkaxsc aclalknc ',
                    price: 17,
                    // categoryId: '1',
                    name: 'Painting',
  
                    subName: 'sub Name',
                    slug: 'painting',
                    // duration: 3,
                  ),

                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
