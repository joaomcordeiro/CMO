import 'package:perg3/lib.dart';
import 'package:perg3/global_variables.dart' as gv;
import 'package:perg3/models/tipo_seguro_class.dart';

void tiposSeguroManutencao() {
  printTiposSeguroList();
  var option = gv.console.readKey();

  // String? option = "2";
  switch (option.toString()) {
    case "1":
      {
        inserirTiposSeguro();
        tiposSeguroManutencao();
      }
      break;

    case "2":
      {
        editarTiposSeguro();
        tiposSeguroManutencao();
      }
      break;

    case "3":
      {
        eliminarTiposSeguro();
        tiposSeguroManutencao();
      }
      break;
    case "4":
      {
        break;
      }

    default:
      {
        print("Opção Inválida!");
      }
  }
}

void printTiposSeguroList() {
  gv.console.clearScreen();
  List<TipoSeguro> temp = gv.tiposSeguro.list;
  List<List<Object>> opcoes = [];
  temp.forEach((element) {
    opcoes.add([element.idTipoSeguro, element.tipo]);
  });
  gv.console.setBackgroundColor(ConsoleColor.blue);
  gv.console.setForegroundColor(ConsoleColor.white);
  gv.console.clearScreen;
  gv.console.writeLine('Manutenção Tipos de Seguro', TextAlignment.center);
  final table = Table()
    ..insertColumn(header: 'Opção', alignment: TextAlignment.center)
    ..insertColumn(header: 'Tipo de Seguro', alignment: TextAlignment.left)
    ..insertRows(opcoes)
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.brightBlue
    ..borderType = BorderType.vertical
    ..headerStyle = FontStyle.bold;
  gv.console.write(table);
  gv.console.setBackgroundColor(ConsoleColor.blue);
  gv.console.setForegroundColor(ConsoleColor.yellow);
  gv.console.clearScreen;
  gv.console.writeLine(
      '1 - Inserir   |  2 - Editar   |   3 - Eliminar   |   4 - Voltar',
      TextAlignment.center);
}

void inserirTiposSeguro() {
  gv.console.writeLine('Tipo de Seguro: ', TextAlignment.left);
  gv.console.setForegroundColor(ConsoleColor.white);
  gv.console.setBackgroundColor(ConsoleColor.black);
  String? tipoSeguro = gv.console.readLine(cancelOnBreak: true);
  if (tipoSeguro != null && tipoSeguro.isNotEmpty) {
    gv.tiposSeguro.add(TipoSeguro(gv.tiposSeguro.list.length + 1, tipoSeguro));
  }
}

void editarTiposSeguro() {
  gv.console.writeLine('ID do tipo de seguro a editar: ', TextAlignment.left);
  String? idTipoSeguro = gv.console.readLine(cancelOnBreak: true);
  if (idTipoSeguro != null && idTipoSeguro.isNotEmpty) {
    gv.console.writeLine(
        'Introduza o nome que subsituirá ${gv.tiposSeguro.getTipoSeguro(int.parse(idTipoSeguro))}: ',
        TextAlignment.left);
    gv.console.setForegroundColor(ConsoleColor.white);
    gv.console.setBackgroundColor(ConsoleColor.black);
    String? tipoSeguro = gv.console.readLine(cancelOnBreak: true);
    if (tipoSeguro != null && tipoSeguro.isNotEmpty) {
      gv.tiposSeguro.setTipoSeguro(int.parse(idTipoSeguro), tipoSeguro);
    }
  }
}

void eliminarTiposSeguro() {
  gv.console.writeLine('ID do tipo de seguro a eliminar: ', TextAlignment.left);
  String? idtipo = gv.console.readLine(cancelOnBreak: true);
  if (idtipo != null && idtipo.isNotEmpty) {
    try {
      gv.tiposSeguro.deleteTipoSeguro(int.parse(idtipo));
    } on DadosComRegistosNasApolices catch (e) {
      gv.console.setForegroundColor(ConsoleColor.red);
      gv.console.setBackgroundColor(ConsoleColor.black);
      gv.console.writeLine(e.errorMessage(), TextAlignment.left);
      sleep(const Duration(seconds: 2));
      gv.console.setForegroundColor(ConsoleColor.white);
      gv.console.setBackgroundColor(ConsoleColor.black);
    }
    ;
  }
}
