import 'package:http/http.dart' as http;
import 'package:integra/utils/key.dart';

import '../models/allCurrencies.dart';
import '../models/ratesmodel.dart';

Future<RatesModel> fetchrates() async {
  final response = await http.get(
      Uri.parse('https://openexchangerates.org/api/latest.json?app_id=' + key));

  print(response.body);
  final result = ratesModelFromJson(response.body);

  return result;
}

Future<Map> fetchcurrencies() async {
  final response = await http.get(Uri.parse(
      'https://openexchangerates.org/api/currencies.json?app_id=' + key));

  final allCurrencies = allCurrenciesFromJson(response.body);
  return allCurrencies;
}

String convertusd(Map exchangeRates, String usd, String currency) {
  String output = ((exchangeRates[currency] * double.parse(usd)))
      .toStringAsFixed(2)
      .toString();

  return output;
}

String convertany(Map exchangeRates, String amount, String from, String to) {
  String output =
      ((double.parse(amount) * exchangeRates[to]) / exchangeRates[from])
          .toStringAsFixed(2)
          .toString();

  return output;
}
