import 'package:flutter/material.dart';
import 'resistor_3_band.dart';
import 'resistor_4_band.dart';
import 'resistor_5_band.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.7;

    return Scaffold(
      appBar: const Header(titleText: 'Resistor App'),
      body: Center(
        child: _buildBody(context, buttonWidth),
      ),
      bottomNavigationBar: Footer(),
    );
  }

  Widget _buildBody(BuildContext context, double buttonWidth) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 0,),
          Image.asset(
            'assets/resistor_image.jpeg',
            width: 600,
          ),
          const SizedBox(height: 0,),
          _buildButton(
            context,
            '3 Band Resistor',
            const Resistor3Band(),
            buttonWidth,
          ),
          const SizedBox(height: 20),
          _buildButton(
            context,
            '4 Band Resistor',
            const Resistor4Band(),
            buttonWidth,
          ),
          const SizedBox(height: 20),
          _buildButton(
            context,
            '5 Band Resistor',
            const Resistor5Band(),
            buttonWidth,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String buttonText,
    Widget route,
    double buttonWidth,
  ) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => route),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 5,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(buttonWidth, 0),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}