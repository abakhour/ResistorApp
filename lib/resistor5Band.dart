import 'package:flutter/material.dart';
import 'resistorWidget.dart';

class Resistor5Band extends StatelessWidget {
  const Resistor5Band({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('5 Band Resistor')),
      body: Center(
        child: ResistorWidget(
          numberOfBands: 5,
          onResistanceCalculated: (resistance, tolerance, minRes, maxRes) {
          },
        ),
      ),
    );
  }
}
