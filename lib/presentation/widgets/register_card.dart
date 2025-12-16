import 'package:flutter/material.dart';
import 'package:afarinick_test/presentation/widgets/inner_shadow_container.dart';

class RegisterCard extends StatelessWidget {
  final String title;
  final Widget icon;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final VoidCallback onAddPressed;
  final Color primaryColor;

  const RegisterCard({
    super.key,
    required this.title,
    required this.icon,
    required this.buttonText,
    required this.onButtonPressed,
    required this.onAddPressed,
    this.primaryColor = const Color(0xFF224C21),
  });

  @override
  Widget build(BuildContext context) {
    return InnerShadowContainer(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(3.62, 4.76),
            blurRadius: 21.86,
            spreadRadius: 2.29,
            color: const Color(0xFF3754AA).withValues(alpha: 0.1),
          ),
          BoxShadow(
            offset: const Offset(-8.2, -8.2),
            blurRadius: 0,
            spreadRadius: -13.74,
            color: const Color(0xFFFFFFFF),
          ),
        ],
      ),
      innerShadows: [
        BoxShadow(
          offset: const Offset(1.09, 1.09),
          blurRadius: 5.72,
          spreadRadius: 12.59,
          color: const Color(0xFFFFFFFF).withValues(alpha: 0.5),
        ),
      ],
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 40, height: 40, child: icon),
                    const SizedBox(width: 12),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 52.0),
                  child: Material(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: onButtonPressed,
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Text(
                          buttonText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          Positioned(
            right: 12,
            bottom: 12,
            child: Material(
              color: primaryColor,
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: onAddPressed,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add, color: Colors.white, size: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
