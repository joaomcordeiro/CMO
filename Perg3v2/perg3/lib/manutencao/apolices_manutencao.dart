import 'package:perg3/lib.dart';
import 'package:perg3/global_variables.dart' as gv;
import 'package:perg3/models/apolice_class.dart';

void apolicesManutencao() {
  printApolicesListOptions();
  gv.console.resetColorAttributes();
  var option = gv.console.readKey();

  // String? option = "2";
  switch (option.toString()) {
    case "1":
      {
        inserirApolice();
        apolicesManutencao();
      }
      break;

    case "2":
      {
        // editarApolice();
        apolicesManutencao();
      }
      break;

    case "3":
      {
        // eliminarApolice();
        apolicesManutencao();
      }
      break;
    case "4":
      {
        break;
      }

    default:
      {
        print("Opção Inválida!");
      }
  }
}

void printApolicesList() {
  gv.console.clearScreen();
  List<List<Object>> opcoes = [];
  gv.apolices.list.forEach((element) {
    String tipoSeguro = gv.tiposSeguro.getTipoSeguro(element.id_tipoSeguro);
    String nomeSeguradora =
        gv.seguradoras.getSeguradoraName(element.id_seguradora);
    String nomeTomador = gv.entidades.getEntidadeNome(element.id_tomador);
    String nomeSegurado = gv.entidades.getEntidadeNome(element.id_segurado);
    String descStatus = "";
    element.status == 0 ? descStatus = "Inativo" : descStatus = "Ativo";
    if (element.id_tomador == element.id_segurado) {
      opcoes.add([
        element.id_apolice,
        tipoSeguro,
        nomeSeguradora,
        nomeTomador,
        "",
        element.periodicidadePag,
        element.valorPremio,
        element.valorSegurado,
        descStatus
      ]);
    } else {
      opcoes.add([
        element.id_apolice,
        tipoSeguro,
        nomeSeguradora,
        nomeTomador,
        nomeSegurado,
        element.periodicidadePag,
        element.valorPremio,
        element.valorSegurado,
        descStatus
      ]);
    }
  });
  gv.console.clearScreen();
  gv.setPageTitleColors();
  gv.console.setTextStyle(bold: true);
  gv.console.writeLine('Manutenção Entidades', TextAlignment.center);
  gv.console.resetColorAttributes();
  gv.console.writeLine('', TextAlignment.center);
  gv.setTableColors();
  final table = Table()
    ..headerColor = ConsoleColor.yellow
    ..insertColumn(header: 'ID', alignment: TextAlignment.center)
    ..insertColumn(header: 'Tipo Seguro', alignment: TextAlignment.left)
    ..insertColumn(header: 'Seguradora', alignment: TextAlignment.left)
    ..insertColumn(header: 'Tomador', alignment: TextAlignment.left)
    ..insertColumn(header: 'Segurado', alignment: TextAlignment.left)
    ..insertColumn(header: 'Period. Pag.', alignment: TextAlignment.left)
    ..insertColumn(header: 'Valor Prémio', alignment: TextAlignment.left)
    ..insertColumn(header: 'Valor Segurado', alignment: TextAlignment.left)
    ..insertColumn(header: 'Status', alignment: TextAlignment.left)
    ..insertRows(opcoes)
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.cyan
    ..borderType = BorderType.vertical
    ..headerStyle = FontStyle.bold;
  gv.console.write(table);
}

void printApolicesListOptions() {
  gv.console.clearScreen();
  printApolicesList();
  gv.setOptionsColors();
  gv.console.writeLine(
      '1 - Inserir   |  2 - Editar   |   3 - Eliminar   |   4 - Voltar',
      TextAlignment.center);
}

void inserirApolice() {
  Apolice novaApolice = Apolice.vazio();
  gv.console.resetColorAttributes();
  printTiposSeguroList("Lista de Tipos de Seguro");
  gv.console.writeLine(
      'Escolha o ID do Tipo de Seguro da nova Apólice: ', TextAlignment.left);
  String? idTipoSeguro = gv.console.readLine(cancelOnBreak: true);

  try {
    if (idTipoSeguro != null) {
      novaApolice.id_tipoSeguro = int.parse(idTipoSeguro.toString());
    }
    printSeguradorasList("Lista de Seguros");
    gv.console.writeLine(
        'Escolha o ID da Seguradora da nova Apólice:', TextAlignment.left);
    String? idSeguradora = gv.console.readLine(cancelOnBreak: true);
    if (idSeguradora != null) {
      novaApolice.id_seguradora = int.parse(idSeguradora.toString());
    }
    printEntidadesList("Lista de Entidades");
    gv.console.writeLine('Escolha o ID da Entidade do TOMADOR da nova Apólice:',
        TextAlignment.left);
    String? idTomador = gv.console.readLine(cancelOnBreak: true);
    if (idTomador != null) {
      novaApolice.id_tomador = int.parse(idTomador.toString());
    }
    gv.console.writeLine(
        'Escolha o ID da Entidade do SEGURADO da nova Apólice:',
        TextAlignment.left);
    String? idSegurado = gv.console.readLine(cancelOnBreak: true);
    if (idSegurado != null) {
      novaApolice.id_segurado = int.parse(idSegurado.toString());
    }
    gv.console.writeLine('Introduza a periodicidade do pagamento do prémio:',
        TextAlignment.left);
    String? periodicidadePag = gv.console.readLine(cancelOnBreak: true);
    if (periodicidadePag != null) {
      novaApolice.periodicidadePag = int.parse(periodicidadePag.toString());
    }
    gv.console.writeLine('Introduza o valor do prémio:', TextAlignment.left);
    String? valorPremio = gv.console.readLine(cancelOnBreak: true);
    if (valorPremio != null) {
      novaApolice.valorPremio = double.parse(valorPremio.toString());
    }
    gv.console.writeLine('Introduza o valor segurado:', TextAlignment.left);
    String? valorSegurado = gv.console.readLine(cancelOnBreak: true);
    if (valorSegurado != null) {
      novaApolice.valorSegurado = double.parse(valorSegurado.toString());
    }
    gv.console.writeLine(
        'Introduza o Status da apólice (0 - Inativo | 1 - Ativo):',
        TextAlignment.left);
    String? descStatus = gv.console.readLine(cancelOnBreak: true);
    if (descStatus != null) {
      novaApolice.status = int.parse(descStatus.toString());
    }
    novaApolice.id_apolice = gv.apolices.list.length + 1;
    gv.apolices.add(novaApolice);
  } on EntidadeCampoVazio catch (e) {
    gv.setForeBackgroundRedBlack();
    gv.console.writeLine(e.errorMessage(), TextAlignment.left);
    sleep(const Duration(seconds: 2));
    gv.setForeBackgroundWhitBlue();
  } on FormatException catch (e) {
    gv.setForeBackgroundRedBlack();
    gv.console.writeLine("A opção tem que ser um número", TextAlignment.left);
    gv.setForeBackgroundWhitBlue();
    sleep(const Duration(seconds: 2));
  } on Exception catch (e) {
    gv.console.writeLine(e, TextAlignment.left);
    sleep(const Duration(seconds: 3));
  }
}

// void editarApolice() {
//   gv.console.writeLine('ID da Entidade a editar: ', TextAlignment.left);
//   String? idEntidade = gv.console.readLine(cancelOnBreak: true);
//   try {
//     if (idEntidade != null && idEntidade.isNotEmpty) {
//       int numIdEntidade = int.parse(idEntidade);
//       Apolice alteraApolice = Apolice(
//           numIdEntidade,
//           gv.entidades.list.elementAt(numIdEntidade - 1).nome,
//           gv.entidades.list.elementAt(numIdEntidade - 1).idade,
//           gv.entidades.list.elementAt(numIdEntidade - 1).morada);
//       gv.console.writeLine(
//           'Introduza o nome que subsituirá ${alteraEntidade.nome}: (<Enter> para não alterar)',
//           TextAlignment.left);
//       gv.console.setForegroundColor(ConsoleColor.white);
//       gv.console.setBackgroundColor(ConsoleColor.black);
//       String? nomeEntidade = gv.console.readLine(cancelOnBreak: true);
//       if (nomeEntidade != null && nomeEntidade.isNotEmpty) {
//         alteraEntidade.nome = nomeEntidade;
//       }
//       gv.console.writeLine(
//           'Introduza a idade que subsituirá ${alteraEntidade.idade}: (<Enter> para não alterar)',
//           TextAlignment.left);
//       gv.console.setForegroundColor(ConsoleColor.white);
//       gv.console.setBackgroundColor(ConsoleColor.black);
//       String? idadeEntidade = gv.console.readLine(cancelOnBreak: true);
//       if (idadeEntidade != null && idadeEntidade.isNotEmpty) {
//         alteraEntidade.idade = int.parse(idadeEntidade);
//       }
//       gv.console.writeLine(
//           'Introduza a morada que subsituirá ${alteraEntidade.morada}: (<Enter> para não alterar)',
//           TextAlignment.left);
//       gv.console.setForegroundColor(ConsoleColor.white);
//       gv.console.setBackgroundColor(ConsoleColor.black);
//       String? moradaEntidade = gv.console.readLine(cancelOnBreak: true);
//       if (moradaEntidade != null && moradaEntidade.isNotEmpty) {
//         alteraEntidade.morada = moradaEntidade;
//       }
//       gv.entidades.setEntidade(numIdEntidade, alteraEntidade);
//     }
//   } on FormatException catch (e) {
//     gv.setForeBackgroundRedBlack();
//     gv.console.writeLine("A idade tem que ser um número", TextAlignment.left);
//     gv.setForeBackgroundWhitBlue();
//     sleep(const Duration(seconds: 2));
//   } on Exception catch (e) {
//     gv.console.writeLine(e, TextAlignment.left);
//     sleep(const Duration(seconds: 3));
//   }
// }

// void eliminarApolice() {
//   gv.console.writeLine('ID da Entidade a eliminar: ', TextAlignment.left);
//   String? idEntidade = gv.console.readLine(cancelOnBreak: true);
//   if (idEntidade != null && idEntidade.isNotEmpty) {
//     try {
//       gv.entidades.deleteEntidade(int.parse(idEntidade));
//     } on DadosComRegistosNasApolices catch (e) {
//       gv.console.setForegroundColor(ConsoleColor.red);
//       gv.console.setBackgroundColor(ConsoleColor.black);
//       gv.console.writeLine(e.errorMessage(), TextAlignment.left);
//       sleep(const Duration(seconds: 2));
//       gv.console.setForegroundColor(ConsoleColor.white);
//       gv.console.setBackgroundColor(ConsoleColor.black);
//     }
//   }
// }
