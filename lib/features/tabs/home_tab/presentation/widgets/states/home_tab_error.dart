
import 'package:flutter/material.dart';


class ErrorMessageWidget extends StatelessWidget {
  final String errorMessage;
   const ErrorMessageWidget({
    super.key,
    required this.errorMessage,
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
              errorMessage,
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

