import 'package:perg3/global_variables.dart' as gv;
import 'package:dart_console/dart_console.dart';

void relatorioApolices() {
  List<List<Object>> info =
      gv.tiposSeguro.getTiposSeguroinfo("relatorioapolices");
  double soma = 0;
  info.forEach((element) {
    soma += double.parse(element[3].toString());
  });
  var total = [
    ["", "", "Total:", soma],
  ];

  gv.console.setBackgroundColor(ConsoleColor.blue);
  gv.console.setForegroundColor(ConsoleColor.white);
  gv.console.clearScreen;
  gv.console.writeLine('Relatório de Apólices ', TextAlignment.center);
  // var info = [
  //   ["Apólices Ativas", gv.apolices.getNumApolicesAtivas()],
  //   ["Apólices Inativas", gv.apolices.getNumApolicesInativas()]
  // ];
  final table = Table()
    ..insertColumn(header: 'Tipo de Seguro', alignment: TextAlignment.left)
    ..insertColumn(header: 'Seguradora', alignment: TextAlignment.left)
    ..insertColumn(header: 'Nº Apólice', alignment: TextAlignment.left)
    ..insertColumn(
        header: 'Valor anual de prémios', alignment: TextAlignment.left)
    ..insertRows(info)
    ..insertRows(total)
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.brightBlue
    ..borderType = BorderType.vertical
    ..headerStyle = FontStyle.bold;
  gv.console.write(table);
}
