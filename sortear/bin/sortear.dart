import 'dart:io';
import 'dart:math';
import 'package:string_scanner/string_scanner.dart';

void main() {
  Random rnd;
  int min = 90;
  int max = 150;
  rnd = Random();
  int r = min + rnd.nextInt(max - min);
  var numeros = [r];
  var primos = [];
  String option = "A";
  print("MENU");
  print("A - O maior e menor elemento do conjunto");
  print("B - A amplitude do conjunto");
  print("C - Uma listagem dos números ímpares com ordenação decrescente");
  print("D- Visualização do conjunto");
  print("Selecione uma opção:");

  switch (option) {
    case "A":
      {
        numeros.sort();
        print(
            'O maior número é ${numeros[0]}, o menor é ${numeros[numeros.length - 1]}');
      }
      break;

    case "B":
      {
        print(numeros.length - 1);
      }
      break;

    case "C":
      {
        for (var i = 0; i <= r; i++) {
          if (isPrime(numeros[i])) {
            primos.add(i);
          } else {}
        }
        primos.sort((b, a) => a.compareTo(b));
        print(primos);
      }
      break;

    case "D":
      {
        print(numeros);
      }
      break;

    default:
      {
        print("Opção Inválida!");
      }
      break;
  }
}

// método de identificação de números primos
bool isPrime(n) {
  for (var i = 2; i <= n / i; ++i) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}
