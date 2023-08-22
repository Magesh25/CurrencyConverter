import 'package:flutter/material.dart';
import 'package:integra/components/anyToAny.dart';
import 'package:integra/components/usdToAny.dart';
import 'package:integra/functions/fetchrates.dart';
import 'package:integra/models/ratesmodel.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({Key? key}) : super(key: key);

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  late Future<RatesModel> result;
  late Future<Map> allCurrencies;

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    result = fetchrates();
    allCurrencies = fetchcurrencies();
  }

  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 229, 181, 7),
      //   elevation: 0,
      //   title: const Text('Currency Converter'),
      //   centerTitle: true,
      // ),
      body: Container(
        height: h,
        width: w,
        padding: EdgeInsets.only(top: 65, left: 15, right: 15),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: FutureBuilder<RatesModel>(
              future: result,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Center(
                    child: FutureBuilder<Map>(
                  future: allCurrencies,
                  builder: (context, currSnapshot) {
                    if (currSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Column(
                      children: [
                        // usdToAny(
                        //     rates: snapshot.data!.rates,
                        //     currencies: currSnapshot.data!),
                        // SizedBox(
                        //   height: 75,
                        // ),
                        AnyToAny(
                            rates: snapshot.data!.rates,
                            currencies: currSnapshot.data!)
                      ],
                    );
                  },
                ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
