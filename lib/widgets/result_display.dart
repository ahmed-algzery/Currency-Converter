import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  final double? result;
  final String? currency;

  const ResultDisplay({
    super.key,
    required this.result,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(
        'Result: ${result!.toStringAsFixed(5)} $currency',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
