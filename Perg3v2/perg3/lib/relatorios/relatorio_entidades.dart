import 'package:perg3/global_variables.dart' as gv;
import 'package:perg3/menu_principal.dart';
import 'package:dart_console/dart_console.dart';

void relatorioEntidades() {
  List<List<Object>> info = gv.apolices.getEntidadesApolices();
  gv.console.clearScreen();
  gv.setPageTitleColors();
  gv.console.writeLine('Relatório de Entidades ', TextAlignment.center);
  gv.console.resetColorAttributes();
  gv.console.writeLine('', TextAlignment.center);
  gv.setTableColors();
  final table = Table()
    ..insertColumn(header: '', alignment: TextAlignment.left)
    ..insertColumn(header: 'Número/Nome', alignment: TextAlignment.left)
    ..insertColumn(header: 'Idade', alignment: TextAlignment.left)
    ..insertColumn(header: 'Morada', alignment: TextAlignment.left)
    ..insertRows(info)
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
