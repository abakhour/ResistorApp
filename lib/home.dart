import 'package:flutter/material.dart';
import 'resistor3Band.dart';
import 'resistor4Band.dart';
import 'resistor5Band.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resistor Color Code')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Resistor3Band()),
                );
              },
              child: const Text('3 Band Resistor'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Resistor4Band()),
                );
              },
              child: const Text('4 Band Resistor'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Resistor5Band()),
                );
              },
              child: const Text('5 Band Resistor'),
            ),
          ],
        ),
      ),
    );
  }
}