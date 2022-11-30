import 'package:perg3/lib.dart';
import 'package:perg3/global_variables.dart' as gv;

void main(List<String> arguments) {
  dataInput();
  var temp = gv.seguradoras.getSeguradorainfo();
  menuPrincipal();

//  apolices.foreach((s){
//   print(apolices);
//  )}
  // print(apolices.list[1].id_apolice);
  print("ACABOU");
}

void menuPrincipal() {
  const opcoes = [
    [1, 'Dashboard'],
    [2, 'Relatório de Apolices'],
    [3, 'Relatório de Entidades'],
    [4, 'Manutenção'],
    [5, 'Sair']
  ];
  // Menu Principal
  gv.console.setBackgroundColor(ConsoleColor.blue);
  gv.console.setForegroundColor(ConsoleColor.white);
  gv.console.clearScreen;
  gv.console.writeLine('Menu Principal', TextAlignment.center);
  final table = Table()
    ..insertColumn(header: 'Numero', alignment: TextAlignment.center)
    ..insertColumn(header: 'Opção', alignment: TextAlignment.left)
    ..insertRows(opcoes)
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.brightBlue
    ..borderType = BorderType.vertical
    ..headerStyle = FontStyle.bold;
  gv.console.write(table);
  String? option = stdin.readLineSync();
  print(table);
  switch (option) {
    case "1":
      {
        dashboard();
      }
      break;

    case "2":
      {
        // print(numeros.length - 1);
      }
      break;

    case "3":
      {
        // for (var i = 0; i <= r; i++) {
        //   if (isPrime(numeros[i])) {
        //     primos.add(i);
        //   } else {}
        // }
        // primos.sort((b, a) => a.compareTo(b));
        // print(primos);
      }
      break;

    case "4":
      {
        // print(numeros);
      }
      break;
    case "5":
      {
        break;
      }

    default:
      {
        print("Opção Inválida!");
      }
      break;
  }
}
