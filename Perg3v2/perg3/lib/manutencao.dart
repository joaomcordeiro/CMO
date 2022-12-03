import 'package:perg3/lib.dart';
import 'package:perg3/global_variables.dart' as gv;

void menuManutencao() {
  gv.console.clearScreen();
  const opcoes = [
    [1, 'Apolices'],
    [2, 'Entidades'],
    [3, 'Seguradoras'],
    [4, 'Tipo de Seguro'],
    [5, 'Voltar']
  ];
  // Menu Manutenção
  gv.console.setBackgroundColor(ConsoleColor.blue);
  gv.console.setForegroundColor(ConsoleColor.white);
  gv.console.clearScreen;
  gv.console.writeLine('Menu Manutenção', TextAlignment.center);
  final table = Table()
    ..insertColumn(header: 'Numero', alignment: TextAlignment.center)
    ..insertColumn(header: 'Opção', alignment: TextAlignment.left)
    ..insertRows(opcoes)
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.brightBlue
    ..borderType = BorderType.vertical
    ..headerStyle = FontStyle.bold;
  gv.console.write(table);
  // var option = gv.console.readKey();
  String? option = "4";
  switch (option) {
    case "1":
      {
        //jkhksdf
      }
      break;

    case "2":
      {
        edicao();
      }
      break;

    case "3":
      {
        seguradorasManutencao();
      }
      break;
    case "4":
      {
        tiposSeguroManutencao();
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
  }
  //
}

void adicao() {
  List<List<Object>> info = gv.apolices.getEntidadesApolices();
  gv.console.setBackgroundColor(ConsoleColor.blue);
  gv.console.setForegroundColor(ConsoleColor.white);
  gv.console.clearScreen;
  gv.console.writeLine('Manutenção ', TextAlignment.center);
  // var info = [
  //   ["Apólices Ativas", gv.apolices.getNumApolicesAtivas()],
  //   ["Apólices Inativas", gv.apolices.getNumApolicesInativas()]
  // ];

  print("Adicionando Seguro");
  print(
      "IdSeguro->IdSegurado->IdSeguradora->idTipoSeguro->Periocidade->Status->idTomador->ValorPremio->Valor Segurado");

  // int? idApolice = int.tryParse(stdin.readLineSync());
  // int? idSegurado = stdin.readLineSync();
  // int? idSegurada = stdin.readLineSync();
  // int? idTipo = stdin.readLineSync();
  // int? Periocidade = stdin.readLineSync();
  // int? Satus = stdin.readLineSync();
  // int? idTomador = stdin.readLineSync();
  // int? valorP = stdin.readLineSync();
  // int? valorS = stdin.readLineSync();
  // gv.apolices.add(Apolice(idApolice, idSegurado, idSegurada, idTipo, Periocidade, Satus, idTomador, valorP, valorS));

  final table = Table()
    ..insertColumn(header: '', alignment: TextAlignment.left)
    ..insertColumn(header: 'Número/Nome', alignment: TextAlignment.left)
    ..insertColumn(header: 'Idade', alignment: TextAlignment.left)
    ..insertColumn(header: 'Morada', alignment: TextAlignment.left)
    ..insertRows(info)
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.brightBlue
    ..borderType = BorderType.vertical
    ..headerStyle = FontStyle.bold;
  gv.console.write(table);
}

void edicao() {
  List<List<Object>> info = gv.apolices.getEntidadesApolices();
  gv.console.setBackgroundColor(ConsoleColor.blue);
  gv.console.setForegroundColor(ConsoleColor.white);
  gv.console.clearScreen;
  gv.console.writeLine('Manutenção ', TextAlignment.center);
  print("Qual id do Seguro a editar?");
  eliminacao();
  adicao();
  // gv.apolices.replaceRange(start, finish, [11, 23, 24]);
  final table = Table()
    ..insertColumn(header: '', alignment: TextAlignment.left)
    ..insertColumn(header: 'Número/Nome', alignment: TextAlignment.left)
    ..insertColumn(header: 'Idade', alignment: TextAlignment.left)
    ..insertColumn(header: 'Morada', alignment: TextAlignment.left)
    ..insertRows(info)
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.brightBlue
    ..borderType = BorderType.vertical
    ..headerStyle = FontStyle.bold;
  gv.console.write(table);
}

void eliminacao() {
  List<List<Object>> info = gv.apolices.getEntidadesApolices();
  gv.console.setBackgroundColor(ConsoleColor.blue);
  gv.console.setForegroundColor(ConsoleColor.white);
  gv.console.clearScreen;
  gv.console.writeLine('Manutenção ', TextAlignment.center);
  // var info = [
  //   ["Apólices Ativas", gv.apolices.getNumApolicesAtivas()],
  //   ["Apólices Inativas", gv.apolices.getNumApolicesInativas()]
  // ];
  print("Qual o id da Apolice a eliminar?");
  // int? remocao = stdin.readLineSync();
  // gv.apolices.removeAt(Apolice(remocao));

  final table = Table()
    ..insertColumn(header: '', alignment: TextAlignment.left)
    ..insertColumn(header: 'Número/Nome', alignment: TextAlignment.left)
    ..insertColumn(header: 'Idade', alignment: TextAlignment.left)
    ..insertColumn(header: 'Morada', alignment: TextAlignment.left)
    ..insertRows(info)
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.brightBlue
    ..borderType = BorderType.vertical
    ..headerStyle = FontStyle.bold;
  gv.console.write(table);
}
