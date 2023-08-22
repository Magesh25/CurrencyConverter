import 'package:flutter/material.dart';

import '../functions/fetchrates.dart';

class AnyToAny extends StatefulWidget {
  final rates;
  final Map currencies;
  const AnyToAny({Key? key, required this.rates, required this.currencies})
      : super(key: key);

  @override
  State<AnyToAny> createState() => _AnyToAnyState();
}

class _AnyToAnyState extends State<AnyToAny> {
  TextEditingController AnyController = TextEditingController();
  String dropdownValue1 = 'USD';

  String dropdownValue2 = 'INR';
  String reslult = '';
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
                'Convert to Any Currency',
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
              key: const Key('Any'),
              controller: AnyController,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Enter Amount',
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
                    value: dropdownValue1,
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
                        dropdownValue1 = newValue!;
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    'To',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.grey.shade900,
                    value: dropdownValue2,
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
                        dropdownValue2 = newValue!;
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
                        reslult = AnyController.text +
                            ' ' +
                            dropdownValue1 +
                            ' = ' +
                            convertany(widget.rates, AnyController.text,
                                dropdownValue1, dropdownValue2) +
                            ' ' +
                            dropdownValue2;
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
