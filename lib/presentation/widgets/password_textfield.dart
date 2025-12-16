import 'package:flutter/material.dart';

class PasswordInputCard extends StatelessWidget {
  final TextEditingController controller;
  final bool obscure;
  final VoidCallback onToggleObscure;
  final Color primary;
  const PasswordInputCard({
    super.key,
    required this.controller,
    required this.obscure,
    required this.onToggleObscure,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: primary, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter your password',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
            suffixIcon: IconButton(
              onPressed: onToggleObscure,
              icon: Icon(
                obscure ? Icons.visibility_off : Icons.visibility,
                color: primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
