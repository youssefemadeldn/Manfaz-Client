import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../tabs/home_tab/data/models/services_based_on_category_model.dart';
import '../widgets/choose_your_service.dart';
import '../widgets/service_poster_details.dart';

class ServicesListViewView extends StatelessWidget {
  final List<ServiceModel> servicesList;
  const ServicesListViewView({super.key, required this.servicesList});

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
            // Container(
            //   padding: EdgeInsets.only(bottom: 12),
            //   height: 200,
            //   child: Center(
            //     child: Image.asset(
            //       'assets/images/resized_services.png',
            //     ),
            //   ),
            // ),
            ChooseYourService(
              servicesList: servicesList,
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: servicesList.length,
              itemBuilder: (context, index) {
                final service = servicesList[index];
                return ServicePosterDetails( 
                  serviceModel: service,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
