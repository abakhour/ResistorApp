import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Resistor Color Code')),
      body: Center(
        child: ResistorWidget(),
      ),
    ),
  ));
}

class ResistorWidget extends StatefulWidget {
  @override
  _ResistorWidgetState createState() => _ResistorWidgetState();
}

class _ResistorWidgetState extends State<ResistorWidget> {
  List<Color?> bandColors = List.filled(6, Colors.black);

  List<Color> resistorColors = [
    Colors.black,
    Colors.brown,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.grey,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display resistor bands
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var color in bandColors)
                Container(
                  width: 20,
                  height: 100,
                  color: color,
                ),
            ],
          ),
          SizedBox(height: 20),
          // Color selection buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < 6; i++)
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DropdownButton<Color>(
                    value: bandColors[i],
                    items: resistorColors.map((color) {
                      return DropdownMenuItem<Color>(
                        value: color,
                        child: Container(
                          width: 20,
                          height: 20,
                          color: color,
                        ),
                      );
                    }).toList(),
                    onChanged: (newColor) {
                      setState(() {
                        bandColors[i] = newColor;
                      });
                    },
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
