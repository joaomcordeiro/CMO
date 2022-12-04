import 'package:perg3/lib.dart';
import 'package:perg3/global_variables.dart' as gv;
import 'package:perg3/models/seguradora_class.dart';

void seguradorasManutencao() {
  printSeguradorasListOptions();
  var option = gv.console.readKey();

  // String? option = "2";
  switch (option.toString()) {
    case "1":
      {
        inserirSeguradora();
        seguradorasManutencao();
      }
      break;

    case "2":
      {
        editarSeguradora();
        seguradorasManutencao();
      }
      break;

    case "3":
      {
        eliminarSeguradora();
        seguradorasManutencao();
      }
      break;
    case "4":
      {
        menuManutencao();
      }
      break;
    default:
      {
        print("Opção Inválida!");
      }
  }
}

void printSeguradorasList(String titulo) {
  List<List<Object>> opcoes = [];
  gv.seguradoras.list.forEach((element) {
    opcoes.add([element.idSeguradora, element.nome]);
  });
  gv.console.clearScreen();
  gv.setPageTitleColors();
  gv.console.setTextStyle(bold: true);
  gv.console.writeLine(titulo, TextAlignment.center);
  gv.console.resetColorAttributes();
  gv.console.writeLine('', TextAlignment.center);
  gv.setTableColors();
  final table = Table()
    ..headerColor = ConsoleColor.yellow
    ..insertColumn(header: 'ID', alignment: TextAlignment.center)
    ..insertColumn(header: 'Seguradora', alignment: TextAlignment.left)
    ..insertRows(opcoes)
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.brightBlue
    ..borderType = BorderType.vertical
    ..headerStyle = FontStyle.bold;
  gv.console.write(table);
}

void printSeguradorasListOptions() {
  gv.console.clearScreen();
  printSeguradorasList('Manutenção Seguradoras');
  gv.setOptionsColors();
  gv.console.writeLine(
      '1 - Inserir   |  2 - Editar   |   3 - Eliminar   |   4 - Voltar',
      TextAlignment.center);
}

void inserirSeguradora() {
  gv.console.writeLine('Nome da Seguradora: ', TextAlignment.left);
  gv.console.setForegroundColor(ConsoleColor.white);
  gv.console.setBackgroundColor(ConsoleColor.black);
  String? nomeSeguradora = gv.console.readLine(cancelOnBreak: true);
  if (nomeSeguradora != null && nomeSeguradora.isNotEmpty) {
    gv.seguradoras
        .add(Seguradora(gv.seguradoras.list.length + 1, nomeSeguradora));
  }
}

void editarSeguradora() {
  gv.console.writeLine('ID da Seguradora a editar: ', TextAlignment.left);
  String? idSeguradora = gv.console.readLine(cancelOnBreak: true);
  if (idSeguradora != null && idSeguradora.isNotEmpty) {
    gv.console.writeLine(
        'Introduza o nome que subsituirá ${gv.seguradoras.getSeguradoraName(int.parse(idSeguradora))}: ',
        TextAlignment.left);
    gv.console.setForegroundColor(ConsoleColor.white);
    gv.console.setBackgroundColor(ConsoleColor.black);
    String? nomeSeguradora = gv.console.readLine(cancelOnBreak: true);
    if (nomeSeguradora != null && nomeSeguradora.isNotEmpty) {
      gv.seguradoras.setNomeSeguradora(int.parse(idSeguradora), nomeSeguradora);
    }
  }
}

void eliminarSeguradora() {
  gv.console.writeLine('ID da Seguradora a eliminar: ', TextAlignment.left);
  String? idSeguradora = gv.console.readLine(cancelOnBreak: true);
  if (idSeguradora != null && idSeguradora.isNotEmpty) {
    try {
      gv.seguradoras.deleteSeguradora(int.parse(idSeguradora));
    } on DadosComRegistosNasApolices catch (e) {
      gv.console.setForegroundColor(ConsoleColor.red);
      gv.console.setBackgroundColor(ConsoleColor.black);
      gv.console.writeLine(e.errorMessage(), TextAlignment.left);
      gv.console.setForegroundColor(ConsoleColor.white);
      gv.console.setBackgroundColor(ConsoleColor.black);
    }
    ;
  }
}
