import 'package:flutter/material.dart';

import '../functions/fetchrates.dart';

class usdToAny extends StatefulWidget {
  final rates;
  final Map currencies;
  const usdToAny({Key? key, required this.rates, required this.currencies})
      : super(key: key);

  @override
  State<usdToAny> createState() => _usdToAnyState();
}

class _usdToAnyState extends State<usdToAny> {
  TextEditingController usdController = TextEditingController();
  String dropdownValue = 'INR';
  String reslult = 'Converted Currency';
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                'USD to Any Currency',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              key: const Key('usd'),
              controller: usdController,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Enter USD',
                hintStyle: TextStyle(color: Colors.white),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.grey.shade900,
                    value: dropdownValue,
                    style: const TextStyle(color: Colors.white),
                    icon: const Icon(
                      Icons.arrow_drop_down_rounded,
                      color: Colors.white,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: widget.currencies.keys
                        .toSet()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        reslult = usdController.text +
                            'USD   =    ' +
                            convertusd(widget.rates, usdController.text,
                                dropdownValue) +
                            ' ' +
                            dropdownValue;
                      });
                    },
                    child: Text('Convert'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              child: Text(
                reslult,
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
