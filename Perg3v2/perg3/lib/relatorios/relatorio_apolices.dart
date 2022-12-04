import 'package:perg3/global_variables.dart' as gv;
import 'package:perg3/menu_principal.dart';
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

  gv.console.clearScreen();
  gv.setPageTitleColors();
  gv.console.writeLine('Relatório de Apólices ', TextAlignment.center);
  gv.console.resetColorAttributes();
  gv.console.writeLine('', TextAlignment.center);
  gv.setTableColors();
  final table = Table()
    ..headerColor = ConsoleColor.yellow
    ..headerStyle = FontStyle.bold
    ..insertColumn(header: 'Tipo de Seguro', alignment: TextAlignment.left)
    ..insertColumn(header: 'Seguradora', alignment: TextAlignment.left)
    ..insertColumn(header: 'Nº Apólice', alignment: TextAlignment.left)
    ..insertColumn(
        header: 'Valor anual de prémios', alignment: TextAlignment.left)
    ..insertRows(info)
    ..insertRows(total)
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.cyan
    ..borderType = BorderType.vertical
    ..headerStyle = FontStyle.bold;
  gv.console.write(table);
  gv.console.writeLine('Escolha qualquer tecla para voltar ao menu principal',
      TextAlignment.left);
  var voidOption = gv.console.readKey();
  menuPrincipal();
}
