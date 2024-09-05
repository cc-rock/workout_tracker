import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, required this.label, this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

class ExpandedRoundButton extends StatelessWidget {
  const ExpandedRoundButton({super.key, required this.label, this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RoundButton(label: label, onPressed: onPressed),
        ),
      ],
    );
  }
}
