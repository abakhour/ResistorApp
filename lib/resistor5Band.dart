import 'package:flutter/material.dart';
import 'resistorWidget.dart';

class Resistor5Band extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('5 Band Resistor')),
      body: Center(
          child: ResistorWidget(numberOfBands: 5)
      ),
    );
  }
}
