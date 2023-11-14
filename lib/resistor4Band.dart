import 'package:flutter/material.dart';
import 'resistorWidget.dart';

class Resistor4Band extends StatelessWidget {

@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('4 Band Resistor')),
      body: Center(
      child: ResistorWidget(numberOfBands: 4)
      ),
    );
    }
}
