import 'package:flutter/widgets.dart';

class ScreenContainer extends StatelessWidget {
  const ScreenContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxWidth: 550),
        child: child,
      ),
    );
  }
}