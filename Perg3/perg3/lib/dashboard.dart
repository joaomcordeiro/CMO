import 'package:perg3/global_variables.dart' as gv;
import 'package:dart_console/dart_console.dart';

void dashboard() {
  gv.console.setBackgroundColor(ConsoleColor.blue);
  gv.console.setForegroundColor(ConsoleColor.white);
  gv.console.clearScreen;
  gv.console.writeLine('Apólices ', TextAlignment.center);
  var info = [
    ["Apólices Ativas", gv.apolices.getNumApolicesAtivas()],
    ["Apólices Inativas", gv.apolices.getNumApolicesInativas()]
  ];
  final table = Table()
    ..insertColumn(header: '', alignment: TextAlignment.left)
    ..insertColumn(header: 'Número', alignment: TextAlignment.left)
    ..insertRows(info)
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.brightBlue
    ..borderType = BorderType.vertical
    ..headerStyle = FontStyle.bold;
  gv.console.write(table);
//Por seguradora: Quantidade e valor médio segurado (só Ativas)
  gv.console.setBackgroundColor(ConsoleColor.blue);
  gv.console.setForegroundColor(ConsoleColor.white);
  gv.console.writeLine('Seguradoras', TextAlignment.center);
  final tableSegur = Table()
    ..insertColumn(header: 'Nome', alignment: TextAlignment.left)
    ..insertColumn(header: 'Quantidade', alignment: TextAlignment.left)
    ..insertColumn(
        header: 'Valor médio segurado', alignment: TextAlignment.left)
    ..insertRows(gv.seguradoras.getSeguradorainfo())
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.brightBlue
    ..borderType = BorderType.vertical
    ..headerStyle = FontStyle.bold;
  gv.console.write(tableSegur);

//Por tipo de seguro: Quantidade e valor anual de prémios (só Ativas)
  gv.console.setBackgroundColor(ConsoleColor.blue);
  gv.console.setForegroundColor(ConsoleColor.white);
  gv.console.writeLine('Tipos de Seguro', TextAlignment.center);
  final tableTipoSegur = Table()
    ..insertColumn(header: 'Tipo', alignment: TextAlignment.left)
    ..insertColumn(header: 'Quantidade', alignment: TextAlignment.left)
    ..insertColumn(
        header: 'Valor médio segurado', alignment: TextAlignment.left)
    ..insertRows(gv.tiposSeguro.getTiposSeguroinfo("dashboard"))
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.brightBlue
    ..borderType = BorderType.vertical
    ..headerStyle = FontStyle.bold;
  gv.console.write(tableTipoSegur);
}
