import 'package:flutter/material.dart';
import 'package:resistor_app/widgets/footer.dart';
import 'package:resistor_app/widgets/header.dart';
import '../widgets/resistor_widget.dart';

class Resistor5Band extends StatelessWidget {
  const Resistor5Band({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (const Header(titleText: '5 Band Resistor')),
      body: Center(
        child: ResistorWidget(
          numberOfBands: 5,
          onResistanceCalculated: (resistance, tolerance, minRes, maxRes) {},
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
