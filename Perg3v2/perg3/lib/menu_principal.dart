import 'package:perg3/lib.dart';
import 'package:perg3/global_variables.dart' as gv;

void menuPrincipal() {
  const opcoes = [
    [1, 'Dashboard'],
    [2, 'Relatório de Apolices'],
    [3, 'Relatório de Entidades'],
    [4, 'Manutenção'],
    [5, 'Sair']
  ];
  // Menu Principal
  gv.console.resetColorAttributes();
  gv.console.clearScreen();
  gv.setTableColors();
  final table = Table()
    ..headerColor = ConsoleColor.brightYellow
    ..headerStyle = FontStyle.bold
    ..title = "Menu Principal"
    ..insertColumn(header: 'Numero', alignment: TextAlignment.center)
    ..insertColumn(header: 'Opção', alignment: TextAlignment.left)
    ..insertRows(opcoes)
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.cyan
    ..borderType = BorderType.vertical;
  // ..headerStyle = FontStyle.bold;
  gv.console.write(table);
  // var option = gv.console.readKey();
  String? option = "4";
  switch (option.toString()) {
    case "1":
      {
        dashboard();
      }
      break;

    case "2":
      {
        relatorioApolices();
      }
      break;

    case "3":
      {
        relatorioEntidades();
      }
      break;

    case "4":
      {
        menuManutencao();
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
      break;
  }
}
