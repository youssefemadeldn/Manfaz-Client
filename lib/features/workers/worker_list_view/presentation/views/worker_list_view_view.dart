import 'package:flutter/material.dart';
import '../../../../../core/theme/app_styles.dart';
import '../widgets/worker_card_item.dart';

class WorkerListViewView extends StatelessWidget {
  const WorkerListViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Workers',
          style: AppStyles.header1,
        ),
        leading: IconButton(
          icon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => WorkerCardItem(),
            ),
          ),
        ],
      )),
    );
  }
}
