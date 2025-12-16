import 'package:flutter/material.dart';

class LabeledField extends StatelessWidget {
  final String label;
  final bool requiredMark;
  final Widget child;
  const LabeledField({
    super.key,
    required this.label,
    required this.child,
    this.requiredMark = false,
  });

  @override
  Widget build(BuildContext context) {
    final primary = const Color(0xFF224C21);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: primary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (requiredMark)
              const Text(
                ' *',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}
