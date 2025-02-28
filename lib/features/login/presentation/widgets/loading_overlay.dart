import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/theme/app_colors.dart';

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final bool showSuccess;
  final Widget child;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.showSuccess,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading || showSuccess)
          Container(
            color: Colors.black54,
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: showSuccess
                    ? Lottie.asset(
                        'assets/animations/success.json',
                        width: 200,
                        height: 200,
                        repeat: false,
                      )
                    : Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                            strokeWidth: 3,
                          ),
                        ),
                      ),
              ),
            ),
          ),
      ],
    );
  }
}
