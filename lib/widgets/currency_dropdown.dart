import 'package:flutter/material.dart';

class CurrencyDropdown extends StatelessWidget {
  final String? value;
  final List<String> currencies;
  final ValueChanged<String?> onChanged;

  const CurrencyDropdown({
    super.key,
    required this.value,
    required this.currencies,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(  // Only use Expanded here to fill space in Row
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          underline: const SizedBox(), // Remove default underline
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
          items: currencies
              .map<DropdownMenuItem<String>>(
                (String currency) => DropdownMenuItem(
                  value: currency,
                  child: Text(
                    currency.toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
