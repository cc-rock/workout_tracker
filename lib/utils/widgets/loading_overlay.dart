import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key, required this.isLoading});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return ColoredBox(
        color: Colors.white.withOpacity(0.5),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
