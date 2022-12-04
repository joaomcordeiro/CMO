import 'dart:io';
import 'dart:math';

void main() {
  //é gerado um numero entre 90 e 150
  //de seguida, esse número é usado como quantidade de números gerados aleatoriamente que populam a lista 'numeros'
  //Depois, a lista é ordenade crescentemente
  int r = Random().nextInt(60) + 90;
  var numeros = List<int>.generate(r, (e) => Random().nextInt(100000));
  numeros.shuffle();
  numeros.sort();
  int menor = numeros[0];
  int maior = numeros[numeros.length - 1];
  var impares = [];
  var pares = [];

  print("");
  print("--------------------------------------------------------------");
  print("                              MENU                            ");
  print("--------------------------------------------------------------");
  print("A - O maior e menor elemento do conjunto");
  print("B - A amplitude do conjunto");
  print("C - Uma listagem dos números ímpares com ordenação decrescente");
  print("D- Visualização do conjunto");
  print("--------------------------------------------------------------");
  print("");

  print("Selecione uma opção:");
  var option = stdin.readLineSync();

  switch (option) {
    case "A":
      {
        print(
            'O menor número é ${numeros[0]}, o maior é ${numeros[numeros.length - 1]}');
      }
      break;

    case "B":
      {
        print('A amplitude do conjunto é ${maior - menor}');
      }
      break;

    case "C":
      {
        //distingue os numeros que sao pares dos que não são e coloca-os em listas separadas
        for (final i in numeros) {
          if (i.isEven) {
            pares.add(i);
          } else {
            impares.add(i);
          }
          //ordena numeros impares por ordem descrescente
          impares.sort((a, b) => b.compareTo(a));
        }

        print('A lista de números impares por ordem decrescente é: $impares');
      }
      break;

    case "D":
      {
        print('O conjunto é composto por: $numeros');
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
