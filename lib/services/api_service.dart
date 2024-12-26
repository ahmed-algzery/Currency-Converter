import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>> fetchExchangeRates() async {
    const url = 'https://api.exchangerate-api.com/v4/latest/USD';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['rates']; // Extract rates from the response
      } else {
        throw Exception('Failed to load exchange rates');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
