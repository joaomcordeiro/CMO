import 'package:perg3/lib.dart';
import 'package:perg3/global_variables.dart' as gv;
import 'package:perg3/models/entidade_class.dart';

void entidadesManutencao() {
  printEntidadesListOptions();

  var option = gv.console.readKey();

  // String? option = "2";
  switch (option.toString()) {
    case "1":
      {
        inserirEntidade();
        entidadesManutencao();
      }
      break;

    case "2":
      {
        editarEntidade();
        entidadesManutencao();
      }
      break;

    case "3":
      {
        eliminarEntidade();
        entidadesManutencao();
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

void printEntidadesList(String titulo) {
  List<List<Object>> opcoes = [];
  gv.entidades.list.forEach((element) {
    opcoes
        .add([element.idEntidade, element.nome, element.idade, element.morada]);
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
    ..insertColumn(header: 'Nome', alignment: TextAlignment.left)
    ..insertColumn(header: 'Idade', alignment: TextAlignment.left)
    ..insertColumn(header: 'Morada', alignment: TextAlignment.left)
    ..insertRows(opcoes)
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.cyan
    ..borderType = BorderType.vertical
    ..headerStyle = FontStyle.bold;
  gv.console.write(table);
}

void printEntidadesListOptions() {
  gv.console.clearScreen();
  printEntidadesList('Manutenção Entidades');
  gv.setOptionsColors();
  gv.console.writeLine(
      '1 - Inserir   |  2 - Editar   |   3 - Eliminar   |   4 - Voltar',
      TextAlignment.center);
}

void inserirEntidade() {
  Entidade novaEntidade = Entidade.vazio();
  gv.console.writeLine('Nome: ', TextAlignment.left);
  gv.console.setForegroundColor(ConsoleColor.white);
  gv.console.setBackgroundColor(ConsoleColor.black);
  String? nomeEntidade = gv.console.readLine(cancelOnBreak: true);

  try {
    novaEntidade.nome = nomeEntidade.toString();
    gv.console.writeLine('Idade: ', TextAlignment.left);
    String? idadeEntidade = gv.console.readLine(cancelOnBreak: true);
    if (idadeEntidade != null) {
      novaEntidade.idade = int.parse(idadeEntidade.toString());
    }
    gv.console.writeLine('Morada: ', TextAlignment.left);
    String? moradaEntidade = gv.console.readLine(cancelOnBreak: true);
    novaEntidade.morada = moradaEntidade.toString();
    novaEntidade.idEntidade = gv.entidades.list.length + 1;
    gv.entidades.add(novaEntidade);
  } on EntidadeCampoVazio catch (e) {
    gv.setForeBackgroundRedBlack();
    gv.console.writeLine(e.errorMessage(), TextAlignment.left);
    sleep(const Duration(seconds: 2));
    gv.setForeBackgroundWhitBlue();
  } on FormatException catch (e) {
    gv.setForeBackgroundRedBlack();
    gv.console.writeLine("A idade tem que ser um número", TextAlignment.left);
    gv.setForeBackgroundWhitBlue();
    sleep(const Duration(seconds: 2));
  } on Exception catch (e) {
    gv.console.writeLine(e, TextAlignment.left);
    sleep(const Duration(seconds: 3));
  }
}

void editarEntidade() {
  gv.console.writeLine('ID da Entidade a editar: ', TextAlignment.left);
  String? idEntidade = gv.console.readLine(cancelOnBreak: true);
  try {
    if (idEntidade != null && idEntidade.isNotEmpty) {
      int numIdEntidade = int.parse(idEntidade);
      Entidade alteraEntidade = Entidade(
          numIdEntidade,
          gv.entidades.list.elementAt(numIdEntidade - 1).nome,
          gv.entidades.list.elementAt(numIdEntidade - 1).idade,
          gv.entidades.list.elementAt(numIdEntidade - 1).morada);
      gv.console.writeLine(
          'Introduza o nome que subsituirá ${alteraEntidade.nome}: (<Enter> para não alterar)',
          TextAlignment.left);
      gv.console.setForegroundColor(ConsoleColor.white);
      gv.console.setBackgroundColor(ConsoleColor.black);
      String? nomeEntidade = gv.console.readLine(cancelOnBreak: true);
      if (nomeEntidade != null && nomeEntidade.isNotEmpty) {
        alteraEntidade.nome = nomeEntidade;
      }
      gv.console.writeLine(
          'Introduza a idade que subsituirá ${alteraEntidade.idade}: (<Enter> para não alterar)',
          TextAlignment.left);
      gv.console.setForegroundColor(ConsoleColor.white);
      gv.console.setBackgroundColor(ConsoleColor.black);
      String? idadeEntidade = gv.console.readLine(cancelOnBreak: true);
      if (idadeEntidade != null && idadeEntidade.isNotEmpty) {
        alteraEntidade.idade = int.parse(idadeEntidade);
      }
      gv.console.writeLine(
          'Introduza a morada que subsituirá ${alteraEntidade.morada}: (<Enter> para não alterar)',
          TextAlignment.left);
      gv.console.setForegroundColor(ConsoleColor.white);
      gv.console.setBackgroundColor(ConsoleColor.black);
      String? moradaEntidade = gv.console.readLine(cancelOnBreak: true);
      if (moradaEntidade != null && moradaEntidade.isNotEmpty) {
        alteraEntidade.morada = moradaEntidade;
      }
      gv.entidades.setEntidade(numIdEntidade, alteraEntidade);
    }
  } on FormatException catch (e) {
    gv.setForeBackgroundRedBlack();
    gv.console.writeLine("A idade tem que ser um número", TextAlignment.left);
    gv.setForeBackgroundWhitBlue();
    sleep(const Duration(seconds: 2));
  } on Exception catch (e) {
    gv.console.writeLine(e, TextAlignment.left);
    sleep(const Duration(seconds: 3));
  }
}

void eliminarEntidade() {
  gv.console.writeLine('ID da Entidade a eliminar: ', TextAlignment.left);
  String? idEntidade = gv.console.readLine(cancelOnBreak: true);
  if (idEntidade != null && idEntidade.isNotEmpty) {
    try {
      gv.entidades.deleteEntidade(int.parse(idEntidade));
    } on DadosComRegistosNasApolices catch (e) {
      gv.console.setForegroundColor(ConsoleColor.red);
      gv.console.setBackgroundColor(ConsoleColor.black);
      gv.console.writeLine(e.errorMessage(), TextAlignment.left);
      sleep(const Duration(seconds: 2));
      gv.console.setForegroundColor(ConsoleColor.white);
      gv.console.setBackgroundColor(ConsoleColor.black);
    }
  }
}
