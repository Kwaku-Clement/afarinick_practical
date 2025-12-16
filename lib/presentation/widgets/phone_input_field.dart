import 'package:afarinick_test/presentation/widgets/country_selector.dart';
import 'package:flutter/material.dart';

class PhoneInputCard extends StatelessWidget {
  final TextEditingController controller;
  final String countryCode;
  final ValueChanged<String> onCountryChanged;
  final Color primary;
  const PhoneInputCard({
    super.key,
    required this.controller,
    required this.countryCode,
    required this.onCountryChanged,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: primary, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CountrySelector(
            value: countryCode,
            onChanged: onCountryChanged,
            primary: primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your phone number here',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
