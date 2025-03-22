import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class UnAvailableServices extends StatelessWidget {
  const UnAvailableServices({
    super.key,
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
                  Icons.not_interested_sharp,
                  color: Colors.red,
                  size: 64,
                ),
                const SizedBox(height: 16),
                Text(
                  tr('home.not_available_service'),
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
