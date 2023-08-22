import 'package:flutter/material.dart';
import 'package:integra/screens/currency_converter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Integra',
      theme: ThemeData(
        primaryColor: Colors.yellowAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: CurrencyConverter(),
    );
  }
}
