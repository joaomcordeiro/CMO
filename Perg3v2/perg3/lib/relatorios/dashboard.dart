import 'package:perg3/global_variables.dart' as gv;
import 'package:dart_console/dart_console.dart';
import 'package:perg3/lib.dart';

void dashboard() {
  gv.console.clearScreen();
  gv.setPageTitleColors();
  gv.console.setTextStyle(bold: true);
  gv.console.writeLine('Dashboard', TextAlignment.center);
  gv.console.resetColorAttributes();
  gv.console.writeLine('', TextAlignment.center);
  var info = [
    ["Apólices Ativas", gv.apolices.getNumApolicesAtivas()],
    ["Apólices Inativas", gv.apolices.getNumApolicesInativas()]
  ];
  gv.setTableColors();
  final table = Table()
    ..headerColor = ConsoleColor.yellow
    ..headerStyle = FontStyle.bold
    ..title = "Apólices"
    ..insertColumn(header: '', alignment: TextAlignment.left)
    ..insertColumn(header: 'Número', alignment: TextAlignment.left)
    ..insertRows(info)
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.cyan
    ..borderType = BorderType.vertical;
  gv.console.write(table);
//Por seguradora: Quantidade e valor médio segurado (só Ativas)
  gv.setTableColors();
  final tableSegur = Table()
    ..headerColor = ConsoleColor.yellow
    ..headerStyle = FontStyle.bold
    ..title = 'Seguradoras'
    ..insertColumn(header: 'Nome', alignment: TextAlignment.left)
    ..insertColumn(header: 'Quantidade', alignment: TextAlignment.left)
    ..insertColumn(
        header: 'Valor médio segurado', alignment: TextAlignment.left)
    ..insertRows(gv.seguradoras.getSeguradorainfo())
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.cyan
    ..borderType = BorderType.vertical;
  gv.console.write(tableSegur);

//Por tipo de seguro: Quantidade e valor anual de prémios (só Ativas)
  gv.setTableColors();
  final tableTipoSegur = Table()
    ..headerColor = ConsoleColor.yellow
    ..headerStyle = FontStyle.bold
    ..title = 'Tipos de Seguro'
    ..insertColumn(header: 'Tipo', alignment: TextAlignment.left)
    ..insertColumn(header: 'Quantidade', alignment: TextAlignment.left)
    ..insertColumn(
        header: 'Valor médio segurado', alignment: TextAlignment.left)
    ..insertRows(gv.tiposSeguro.getTiposSeguroinfo("dashboard"))
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.cyan
    ..borderType = BorderType.vertical;
  gv.console.write(tableTipoSegur);
  gv.console.writeLine('Escolha qualquer tecla para voltar ao menu principal',
      TextAlignment.left);
  var voidOption = gv.console.readKey();
  menuPrincipal();
}
