import 'package:flutter/material.dart';
import 'resistorWidget.dart';

class Resistor3Band extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('3 Band Resistor')),
      body: Center(
        child: ResistorWidget()
      ),
    );
  }
}
