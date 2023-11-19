import 'dart:math';
import 'package:flutter/material.dart';

class ResistorBand {
  final Color color;
  final double value;

  ResistorBand(this.color, this.value);
}

class ToleranceBand {
  final Color color;
  final double value;

  ToleranceBand(this.color, this.value);
}

class ResistorWidget extends StatefulWidget {
  final int numberOfBands;
  final void Function(double, double, double, double) onResistanceCalculated;

  const ResistorWidget({
    Key? key,
    this.numberOfBands = 3,
    required this.onResistanceCalculated,
  }) : super(key: key);

  @override
  _ResistorWidgetState createState() => _ResistorWidgetState();
}

class _ResistorWidgetState extends State<ResistorWidget> {
  late List<ResistorBand> resistorBands;
  late List<ToleranceBand> toleranceBands;

  final List toleranceColors = [
    ToleranceBand(Colors.brown, 1),
    ToleranceBand(Colors.red, 2),
    ToleranceBand(Colors.orange, 3),
    ToleranceBand(Colors.yellow, 4),
    ToleranceBand(Colors.green, 0.5),
    ToleranceBand(Colors.blue, 0.25),
    ToleranceBand(Colors.purple, 0.1),
    ToleranceBand(Colors.grey, 0.05),
    ToleranceBand(Color(0xFFFFD700), 5), // Gold
    ToleranceBand(Color(0xFFC0C0C0), 10) // Silver
  ];


  final List<ResistorBand> resistorColors = [
    ResistorBand(Colors.black, 0),
    ResistorBand(Colors.brown, 1),
    ResistorBand(Colors.red, 2),
    ResistorBand(Colors.orange, 3),
    ResistorBand(Colors.yellow, 4),
    ResistorBand(Colors.green, 5),
    ResistorBand(Colors.blue, 6),
    ResistorBand(Colors.purple, 7),
    ResistorBand(Colors.grey, 8),
    ResistorBand(Colors.white, 9),
  ];

  @override
  void initState() {
    super.initState();

    toleranceBands = List<ToleranceBand>.filled(widget.numberOfBands, toleranceColors[0]);

    resistorBands = List.filled(widget.numberOfBands, resistorColors[0]);
    widget.onResistanceCalculated(
      calculateResistance(),
      calculateTolerance(),
      calculateMinResistance(),
      calculateMaxResistance(),
    );
  }


  double calculateTolerance() {
    double Tolerance = 0.0;
    if (widget.numberOfBands == 3) {
      return 20;
    }
    for (var band in toleranceBands) {
      Tolerance = band.value;
    }
    return Tolerance;
  }


  double calculateResistance() {
    double firstDigit = resistorBands[0].value;
    double secondDigit = resistorBands[1].value;
    double thirdDigit = 0;
    int multipIndex = resistorBands.length - 2;
    double multiplier = resistorBands[multipIndex].value;

    if (resistorBands.length == 3) {
      firstDigit = resistorBands[0].value;
      secondDigit = resistorBands[1].value;
      multiplier = resistorBands[2].value;
    }
    if (resistorBands.length == 5) {
      firstDigit = 10 * resistorBands[0].value;
      secondDigit = 10 * resistorBands[1].value;
      thirdDigit = resistorBands[2].value;
    }

    double significantFigures = (firstDigit * 10) + secondDigit + thirdDigit;
    double resistanceValue =
        significantFigures * pow(10, multiplier).toDouble();

    return resistanceValue;
  }


  double calculateMinResistance() {
    double resistance = calculateResistance();
    double tolerance = calculateTolerance() / 100;
    return resistance - (resistance * tolerance);
  }

  double calculateMaxResistance() {
    double resistance = calculateResistance();
    double tolerance = calculateTolerance() / 100;
    return resistance + (resistance * tolerance);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildResistorBands(),
          const SizedBox(height: 20),
          buildColorSelection(),
          const SizedBox(height: 20),
          Text(
            'Resistance: ${calculateResistance().toStringAsFixed(2)} ohms',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            'Tolerance: ${calculateTolerance().toStringAsFixed(2)}%',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            'Min Resistance: ${calculateMinResistance().toStringAsFixed(
                2)} ohms',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
              'Max Resistance: ${calculateMaxResistance().toStringAsFixed(
                  2)} ohms',
              style: const TextStyle(fontSize: 16)
          )
        ],
      ),
    );
  }

  Widget buildResistorBands() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var band in resistorBands)
          Container(
            width: 20,
            height: 100,
            color: band.color,
          ),
      ],
    );
  }

  Widget buildColorSelection() {
    List<Widget> rows = [];
    for (var i = 0; i < widget.numberOfBands; i += 2) {
      List<Widget> rowChildren = [];
      for (var j = i; j < i + 2 && j < widget.numberOfBands; j++) {
        if (j == widget.numberOfBands - 1 && j >= 3) {
          rowChildren.add(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<ToleranceBand>(
                value: toleranceBands[j],
                items: toleranceColors.map((band) {
                  return DropdownMenuItem<ToleranceBand>(
                    value: band,
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: band.color,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${_colorName(band.color)} ${band.value}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (newBand) {
                  setState(() {
                    toleranceBands[j] = newBand!;
                  });
                },
              ),
            ),
          );
        } else {
          rowChildren.add(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<ResistorBand>(
                value: resistorBands[j],
                items: resistorColors.map((band) {
                  return DropdownMenuItem<ResistorBand>(
                    value: band,
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: band.color,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${_colorName(band.color)} ${band.value}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (newBand) {
                  setState(() {
                    resistorBands[j] = newBand!;
                    widget.onResistanceCalculated(
                      calculateResistance(),
                      calculateTolerance(),
                      calculateMinResistance(),
                      calculateMaxResistance(),
                    );
                  });
                },
              ),
            ),
          );
        }
      }
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rowChildren,
        ),
      );
    }
    return Column(
      children: rows,
    );
  }
}

  String _colorName(Color color) {
  if (color == Colors.black) return 'Black';
  if (color == Colors.brown) return 'Brown';
  if (color == Colors.red) return 'Red';
  if (color == Colors.orange) return 'Orange';
  if (color == Colors.yellow) return 'Yellow';
  if (color == Colors.green) return 'Green';
  if (color == Colors.blue) return 'Blue';
  if (color == Colors.purple) return 'Purple';
  if (color == Colors.grey) return 'Grey';
  if (color == Colors.white) return 'White';
  if (color == Color(0xFFFFD700) ) return 'Gold';
  if (color == Color(0xFFC0C0C0) ) return 'Silver';
  return 'Unknown';
}
