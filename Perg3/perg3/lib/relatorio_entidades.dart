import 'package:perg3/global_variables.dart' as gv;
import 'package:dart_console/dart_console.dart';

void relatorioEntidades() {
  List<List<Object>> info = gv.apolices.getEntidadesApolices();
  gv.console.setBackgroundColor(ConsoleColor.blue);
  gv.console.setForegroundColor(ConsoleColor.white);
  gv.console.clearScreen;
  gv.console.writeLine('Relatório de Entidades ', TextAlignment.center);
  // var info = [
  //   ["Apólices Ativas", gv.apolices.getNumApolicesAtivas()],
  //   ["Apólices Inativas", gv.apolices.getNumApolicesInativas()]
  // ];
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
