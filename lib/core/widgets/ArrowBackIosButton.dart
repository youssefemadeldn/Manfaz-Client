import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ArrowBackIosButton extends StatelessWidget {
  const ArrowBackIosButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios, color: AppColors.icon),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}