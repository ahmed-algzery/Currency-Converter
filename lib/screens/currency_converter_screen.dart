import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/currency_dropdown.dart';
import '../widgets/result_display.dart';

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CurrencyConverterScreenState createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  Map<String, dynamic>? exchangeRates;
  final TextEditingController _amountController = TextEditingController();
  String? _fromCurrency = "USD";
  String? _toCurrency = "AED";
  double? _result;

  @override
  void initState() {
    super.initState();
    _loadExchangeRates();
  }

  Future<void> _loadExchangeRates() async {
    final apiService = ApiService();
    final rates = await apiService.fetchExchangeRates();
    setState(() {
      exchangeRates = rates;
      _fromCurrency = rates.keys.first;
      _toCurrency = rates.keys.first;
    });
  }

  void _convertCurrency() {
    if (exchangeRates == null) return;

    final amount = double.tryParse(_amountController.text) ?? 0;
    final fromRate = exchangeRates?[_fromCurrency];
    final toRate = exchangeRates?[_toCurrency];

    if (fromRate != null && toRate != null) {
      setState(() {
        _result = (amount / fromRate) * toRate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter' ,style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Amount',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _amountController,
                        decoration: const InputDecoration(
                          hintText: 'Enter amount to convert',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                        keyboardType: TextInputType.number,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  // Use Flexible or Expanded for proper layout
                  Flexible(
                    child: CurrencyDropdown(
                      value: _fromCurrency,
                      onChanged: (value) {
                        setState(() {
                          if (value != _toCurrency) {
                            _fromCurrency = value;
                          }
                        });
                      },
                      currencies: exchangeRates?.keys.toList() ?? [],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: CurrencyDropdown(
                      value: _toCurrency,
                      onChanged: (value) {
                        setState(() {
                          if (value != _fromCurrency) {
                            _toCurrency = value;
                          }
                        });
                      },
                      currencies: exchangeRates?.keys.toList() ?? [],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _convertCurrency,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16), backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                child: const Text('Convert' , style: TextStyle(fontSize: 18, color: Colors.white),),
              ),
              const SizedBox(height: 24),
              if (_result != null)
                ResultDisplay(
                  result: _result,
                  currency: _toCurrency,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
