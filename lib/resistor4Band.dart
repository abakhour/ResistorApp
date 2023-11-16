import 'package:flutter/material.dart';
import 'resistorWidget.dart';

class Resistor4Band extends StatelessWidget {
  const Resistor4Band({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('4 Band Resistor')),
      body: Center(
        child: ResistorWidget(
          numberOfBands: 4,
          onResistanceCalculated: (resistance, tolerance) {
          },
        ),
      ),
    );
  }
}

