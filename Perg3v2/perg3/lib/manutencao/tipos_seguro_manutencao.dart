import 'package:perg3/lib.dart';
import 'package:perg3/global_variables.dart' as gv;
import 'package:perg3/models/tipo_seguro_class.dart';

void tiposSeguroManutencao() {
  printTiposSeguroListOptions();
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
        menuManutencao();
      }
      break;

    default:
      {
        print("Opção Inválida!");
      }
  }
}

void printTiposSeguroList(String titulo) {
  List<List<Object>> opcoes = [];
  gv.tiposSeguro.list.forEach((element) {
    opcoes.add([element.idTipoSeguro, element.tipo]);
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
    ..insertColumn(header: 'Tipo de Seguro', alignment: TextAlignment.left)
    ..insertRows(opcoes)
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.cyan
    ..borderType = BorderType.vertical
    ..headerStyle = FontStyle.bold;
  gv.console.write(table);
}

void printTiposSeguroListOptions() {
  gv.console.clearScreen();
  printTiposSeguroList('Manutenção Tipos de Seguro');
  gv.setOptionsColors();
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
