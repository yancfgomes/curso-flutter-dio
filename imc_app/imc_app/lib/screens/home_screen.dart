import 'package:flutter/material.dart';
import '../models/pessoa.dart';
import '../utils/calculos.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _alturaController = TextEditingController();
  final _pesoController = TextEditingController();

  void _calcularIMC() {
    double altura = double.tryParse(_alturaController.text) ?? 0;
    double peso = double.tryParse(_pesoController.text) ?? 0;

    if (altura == 0 || peso == 0) {
      return; // Exibir mensagem de erro
    }

    Pessoa pessoa = Pessoa(altura: altura, peso: peso);
    double imc = pessoa.calcularIMC();
    String classificacao = pessoa.classificarIMC();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(imc: imc, classificacao: classificacao),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Campo para altura
              TextFormField(
                controller: _alturaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Altura (cm)',
                  hintText: 'Ex: 170',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a sua altura';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),

              // Campo para peso
              TextFormField(
                controller: _pesoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Peso (kg)',
                  hintText: 'Ex: 70',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o seu peso';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),

              // Botão para calcular IMC
              ElevatedButton(
                onPressed: _calcularIMC,
                child: Text('Calcular IMC'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
