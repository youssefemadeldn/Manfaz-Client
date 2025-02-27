import 'package:flutter/material.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widgets/ArrowBackIosButton.dart';
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
        leading: ArrowBackIosButton(),
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

