import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imc/main.dart';


void main() {
  testWidgets('Calculadora de IMC', (WidgetTester tester) async {
    // Constrói o aplicativo e aciona um frame.
    await tester.pumpWidget(MyApp());

    // Verifica se o título está sendo exibido.
    expect(find.text('Calculadora de IMC'), findsOneWidget);

    // Insere um valor no campo de peso.
    await tester.enterText(find.byType(TextField).at(0), '70');

    // Insere um valor no campo de altura.
    await tester.enterText(find.byType(TextField).at(1), '175');

    // Toca no botão de calcular.
    await tester.tap(find.byType(ElevatedButton));

    // Reconstroi o widget após a interação.
    await tester.pump();

    // Verifica se o resultado do cálculo está correto.
    expect(find.textContaining('IMC: 22.86'), findsOneWidget);
    expect(find.textContaining('(Peso normal)'), findsOneWidget);
  });
}
