import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/choose_your_service.dart';
import '../widgets/service_poster_details.dart';

class HomeServiceDetailsView extends StatelessWidget {
  const HomeServiceDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(tr('home_service_details_view.paints'),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ServicePosterDetails();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
