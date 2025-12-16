import 'package:flutter/material.dart';

class CountrySelector extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;
  final Color primary;
  const CountrySelector({
    super.key,
    required this.value,
    required this.onChanged,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          dropdownColor: primary,
          iconEnabledColor: Colors.white,
          items: [
            DropdownMenuItem(
              value: 'GH',
              child: Image.asset('assets/flag_of_Ghana.png', width: 26),
            ),
          ],
          onChanged: (v) {
            if (v != null) onChanged(v);
          },
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
