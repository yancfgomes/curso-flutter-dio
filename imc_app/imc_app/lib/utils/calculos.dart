double calcularIMC(double altura, double peso) {
  return peso / (altura * altura);
}

String classificarIMC(double imc) {
  if (imc < 18.5) {
    return "Abaixo do peso";
  } else if (imc < 25) {
    return "Peso normal";
  } else if (imc < 30) {
    return "Sobrepeso";
  } else {
    return "Obesidade";
  }
}
