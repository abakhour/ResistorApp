import 'package:flutter/material.dart';

class ResistorBand {
  final Color color;
  final int value;

  ResistorBand(this.color, this.value);
}

class ResistorWidget extends StatefulWidget {
  final int numberOfBands;

  ResistorWidget({this.numberOfBands = 3});

  @override
  _ResistorWidgetState createState() => _ResistorWidgetState();
}

class _ResistorWidgetState extends State<ResistorWidget> {
  late List<ResistorBand> resistorBands;

  List<ResistorBand> resistorColors = [
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
    resistorBands = List.filled(widget.numberOfBands, resistorColors[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display resistor bands
          buildResistorBands(),

          SizedBox(height: 20),

          // Color selection buttons
          buildColorSelection(),
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
        rowChildren.add(
          Padding(
            padding: EdgeInsets.all(8.0),
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
                      SizedBox(width: 8),
                      Text(
                        '${_colorName(band.color)} ${band.value}',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (newBand) {
                setState(() {
                  resistorBands[j] = newBand!;
                });
              },
            ),
          ),
        );
      }
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rowChildren,
      ));
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
    return 'Unknown';
  }
