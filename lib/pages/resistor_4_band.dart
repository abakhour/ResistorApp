import 'package:flutter/material.dart';
import 'package:resistor_app/widgets/footer.dart';
import 'package:resistor_app/widgets/header.dart';
import '../widgets/resistor_widget.dart';

class Resistor4Band extends StatelessWidget {
  const Resistor4Band({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (const Header(titleText: '4 Band Resistor')),
      body: Center(
        child: ResistorWidget(
          numberOfBands: 4,
          onResistanceCalculated: (resistance, tolerance, minRes, maxRes) {},
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
