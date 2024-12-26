// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Currency Converter',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const CurrencyConverter(),
//     );
//   }
// }

// class CurrencyConverter extends StatefulWidget {
//   const CurrencyConverter({super.key});

//   @override
//   _CurrencyConverterState createState() => _CurrencyConverterState();
// }

// class _CurrencyConverterState extends State<CurrencyConverter> {
//   Map<String, dynamic>? exchangeRates;
//   final TextEditingController _amountController = TextEditingController();
//   String? _fromCurrency = "USD";
//   String? _toCurrency = "AED";
//   double? _result;

//   @override
//   void initState() {
//     super.initState();
//     _loadExchangeRates();
//   }

//   // GET method to fetch exchange rates
//   Future<void> _loadExchangeRates() async {
//     const url =
//         'https://api.exchangerate-api.com/v4/latest/USD'; // Example API, replace with your API if needed
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           exchangeRates = data['rates']; // Extract rates from the response
//         });

//         // Ensure the default selected currencies exist in the API data
//         if (!exchangeRates!.containsKey(_fromCurrency)) {
//           _fromCurrency = exchangeRates!.keys.first;
//         }
//         if (!exchangeRates!.containsKey(_toCurrency)) {
//           _toCurrency = exchangeRates!.keys.first;
//         }
//       } else {
//         throw Exception('Failed to load exchange rates');
//       }
//     } catch (e) {
//       print('Error: $e');
//       // Handle error if API fails
//     }
//   }

//   void _convertCurrency() {
//     if (exchangeRates == null) return;  // Ensure exchangeRates are not null

//     var amount = double.tryParse(_amountController.text) ?? 0;
//     var fromRate = exchangeRates?[_fromCurrency];  // Access directly from the map
//     double? toRate = exchangeRates?[_toCurrency];  // Access directly from the map

//     if (fromRate != null && toRate != null) {
//       setState(() {
//         _result = (amount / fromRate) * toRate; // Perform conversion
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Currency Converter')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _amountController,
//               decoration: const InputDecoration(labelText: 'Amount'),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child: DropdownButton<String>(
//                     value: _fromCurrency,
//                     isExpanded: true,
//                     items: exchangeRates == null
//                         ? []
//                         : exchangeRates!.keys
//                             .map<DropdownMenuItem<String>>(
//                               (String value) => DropdownMenuItem(
//                                 value: value,
//                                 child: Text(value.toUpperCase()),
//                               ),
//                             )
//                             .toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         // Prevent selecting the same value for both from and to currency
//                         if (value != _toCurrency) {
//                           _fromCurrency = value;
//                         }
//                       });
//                     },
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: DropdownButton<String>(
//                     value: _toCurrency,
//                     isExpanded: true,
//                     items: exchangeRates == null
//                         ? []
//                         : exchangeRates!.keys
//                             .map<DropdownMenuItem<String>>(
//                               (String value) => DropdownMenuItem(
//                                 value: value,
//                                 child: Text(value.toUpperCase()),
//                               ),
//                             )
//                             .toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         // Prevent selecting the same value for both from and to currency
//                         if (value != _fromCurrency) {
//                           _toCurrency = value;
//                         }
//                       });
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: _convertCurrency,
//               child: const Text('Convert'),
//             ),
//             if (_result != null)
//               Padding(
//                 padding: const EdgeInsets.only(top: 16),
//                 child: Text(
//                   'Result: ${_result!.toStringAsFixed(5)} $_toCurrency',
//                   style: const TextStyle(
//                       fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'screens/currency_converter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CurrencyConverterScreen(),
    );
  }
}
