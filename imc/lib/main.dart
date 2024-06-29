import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IMCCalculator(),
    );
  }
}

class IMCCalculator extends StatefulWidget {
  @override
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _result = '';

  void _calculateIMC() {
    final double weight = double.parse(_weightController.text);
    final double height = double.parse(_heightController.text) / 100;
    final double imc = weight / (height * height);

    setState(() {
      if (imc < 18.5) {
        _result = 'IMC: ${imc.toStringAsFixed(2)} (Baixo peso)';
      } else if (imc < 24.9) {
        _result = 'IMC: ${imc.toStringAsFixed(2)} (Peso normal)';
      } else if (imc < 29.9) {
        _result = 'IMC: ${imc.toStringAsFixed(2)} (Sobrepeso)';
      } else {
        _result = 'IMC: ${imc.toStringAsFixed(2)} (Obesidade)';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Altura (cm)',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateIMC,
              child: Text('Calcular IMC'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

