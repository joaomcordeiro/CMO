import 'package:perg3/lib.dart';
import 'package:perg3/global_variables.dart' as gv;

void menuManutencao() {
  gv.console.resetColorAttributes();
  const opcoes = [
    [1, 'Apolices'],
    [2, 'Entidades'],
    [3, 'Seguradoras'],
    [4, 'Tipo de Seguro'],
    [5, 'Voltar']
  ];
  // Menu Manutenção
  gv.console.clearScreen();
  gv.setPageTitleColors();
  gv.console.writeLine('Menu Manutenção', TextAlignment.center);
  gv.console.resetColorAttributes();
  gv.console.writeLine('', TextAlignment.center);
  gv.setTableColors();
  final table = Table()
    ..insertColumn(header: 'Numero', alignment: TextAlignment.center)
    ..insertColumn(header: 'Opção', alignment: TextAlignment.left)
    ..insertRows(opcoes)
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.cyan
    ..borderType = BorderType.vertical
    ..headerStyle = FontStyle.bold;
  gv.console.write(table);
  // var optionMenuManutencao = gv.console.readKey();
  String? optionMenuManutencao = "1";
  switch (optionMenuManutencao.toString()) {
    case "1":
      {
        apolicesManutencao();
      }
      break;

    case "2":
      {
        entidadesManutencao();
      }
      break;

    case "3":
      {
        seguradorasManutencao();
      }
      break;
    case "4":
      {
        tiposSeguroManutencao();
      }
      break;
    case "5":
      {
        menuPrincipal();
      }
      break;

    default:
      {
        print("Opção Inválida!");
      }
  }
  //
}
