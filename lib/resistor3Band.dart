import 'package:flutter/material.dart';
import 'resistorWidget.dart';

class Resistor3Band extends StatelessWidget {
  const Resistor3Band({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3 Band Resistor')),
      body: Center(
        child: ResistorWidget(
          numberOfBands: 3,
          onResistanceCalculated: (resistance, tolerance, minRes, maxRes) {
          },
        ),
      ),
    );
  }
}