import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double imc;
  final String classificacao;

  const ResultScreen({required this.imc, required this.classificacao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do IMC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Seu IMC é: ${imc.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Classificação: $classificacao',
              style: TextStyle(fontSize: 18.0),
            ),
            // ... Adicione widgets para exibir explicações sobre o resultado
          ],
        ),
      ),
    );
  }
}
