
import 'package:flutter/material.dart';

import '../../controller/home_tab_cubit/home_tab_cubit.dart';

class HomeTabError extends StatelessWidget {
  final HomeTabErrorState state;
   const HomeTabError({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              state.failure.errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            // if (onRetry != null) ...[
            //   const SizedBox(height: 16),
            //   ElevatedButton(
            //     onPressed: onRetry,
            //     child: Text('Retry'),
            //   ),
            // ],
          ],
        ),
      ),
    );
  }
}

