import 'package:perg3/lib.dart';
import 'package:perg3/global_variables.dart' as gv;
import 'package:perg3/models/apolice_class.dart';

void apolicesManutencao() {
  printApolicesListOptions();
  gv.console.resetColorAttributes();
  try {
    var option = gv.console.readKey();
    switch (option.toString()) {
      case "1":
        {
          inserirApolice();
          apolicesManutencao();
        }
        break;

      case "2":
        {
          editarApolice();
          apolicesManutencao();
        }
        break;

      case "3":
        {
          eliminarApolice();
          apolicesManutencao();
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
          gv.console.resetColorAttributes();
          apolicesManutencao();
        }
    }
  } on FormatException catch (e) {
    gv.setWarningColors();
    gv.console.writeLine("A opção tem que ser um número", TextAlignment.left);
    gv.console.resetColorAttributes();
    sleep(const Duration(seconds: 2));
    apolicesManutencao();
  }
}

void printApolicesList() {
  gv.console.clearScreen();
  gv.console.resetColorAttributes();
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
    printSeguradorasList("Lista de Seguradoras");
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
    gv.setWarningColors();
    gv.console.writeLine(e.errorMessage(), TextAlignment.left);
    sleep(const Duration(seconds: 2));
    gv.console.resetColorAttributes();
  } on FormatException catch (e) {
    gv.setWarningColors();
    gv.console.writeLine("A opção tem que ser um número", TextAlignment.left);
    gv.console.resetColorAttributes();
    sleep(const Duration(seconds: 2));
  } on Exception catch (e) {
    gv.console.writeLine(e, TextAlignment.left);
    sleep(const Duration(seconds: 3));
  }
}

void editarApolice() {
  gv.console.writeLine('ID da Apólice a editar: ', TextAlignment.left);
  String? idApolice = gv.console.readLine(cancelOnBreak: true);
  try {
    if (idApolice != null && idApolice.isNotEmpty) {
      int numIdApolice = int.parse(idApolice);
      Apolice alteraApolice = Apolice(
          numIdApolice,
          gv.apolices.list
              .where((element) => element.id_apolice == numIdApolice)
              .first
              .id_segurado,
          gv.apolices.list
              .where((element) => element.id_apolice == numIdApolice)
              .first
              .id_seguradora,
          gv.apolices.list
              .where((element) => element.id_apolice == numIdApolice)
              .first
              .id_tipoSeguro,
          gv.apolices.list
              .where((element) => element.id_apolice == numIdApolice)
              .first
              .periodicidadePag,
          gv.apolices.list
              .where((element) => element.id_apolice == numIdApolice)
              .first
              .status,
          gv.apolices.list
              .where((element) => element.id_apolice == numIdApolice)
              .first
              .id_tomador,
          gv.apolices.list
              .where((element) => element.id_apolice == numIdApolice)
              .first
              .valorPremio,
          gv.apolices.list
              .where((element) => element.id_apolice == numIdApolice)
              .first
              .valorSegurado);
      int terminar = 0;
      do {
        const campos = [
          [1, 'Tipo de Seguro'],
          [2, 'Seguradora'],
          [3, 'Tomador'],
          [4, 'Segurado'],
          [5, 'Periodicidade Pagamento'],
          [6, 'Valor  do prémio'],
          [7, 'Valor Segurado'],
          [8, 'Status'],
          [9, 'Terminar']
        ];
        gv.setTableColors();
        final table = Table()
          ..headerColor = ConsoleColor.brightYellow
          ..headerStyle = FontStyle.bold
          ..title = " Escolha o campo que quer alterar da Apólice $idApolice "
          ..insertColumn(header: 'Numero', alignment: TextAlignment.center)
          ..insertColumn(header: 'Campo', alignment: TextAlignment.left)
          ..insertRows(campos)
          ..borderStyle = BorderStyle.rounded
          ..borderColor = ConsoleColor.cyan
          ..borderType = BorderType.vertical;
        gv.console.write(table);
        var optionCampo = gv.console.readKey();
        // String? option = "2";
        switch (optionCampo.toString()) {
          case "1":
            {
              printTiposSeguroList("Lista de Tipos de Seguro");
              gv.console.writeLine(
                  'Escolha o ID do Tipo de Seguro da Apólice: ',
                  TextAlignment.left);
              String? idTipoSeguro = gv.console.readLine(cancelOnBreak: true);
              if (idTipoSeguro != null) {
                alteraApolice.id_tipoSeguro =
                    int.parse(idTipoSeguro.toString());
              }
            }
            break;

          case "2":
            {
              printSeguradorasList("Lista de Seguradoras");
              gv.console.writeLine(
                  'Escolha o ID da Seguradora da Apólice:', TextAlignment.left);
              String? idSeguradora = gv.console.readLine(cancelOnBreak: true);
              if (idSeguradora != null) {
                alteraApolice.id_seguradora =
                    int.parse(idSeguradora.toString());
              }
            }
            break;

          case "3":
            {
              printEntidadesList("Lista de Entidades");
              gv.console.writeLine(
                  'Escolha o ID da Entidade do TOMADOR da nova Apólice:',
                  TextAlignment.left);
              String? idTomador = gv.console.readLine(cancelOnBreak: true);
              if (idTomador != null) {
                alteraApolice.id_tomador = int.parse(idTomador.toString());
              }
            }
            break;
          case "4":
            {
              printEntidadesList("Lista de Entidades");
              gv.console.writeLine(
                  'Escolha o ID da Entidade do SEGURADO da nova Apólice:',
                  TextAlignment.left);
              String? idSegurado = gv.console.readLine(cancelOnBreak: true);
              if (idSegurado != null) {
                alteraApolice.id_segurado = int.parse(idSegurado.toString());
              }
            }
            break;
          case "5":
            {
              gv.console.writeLine(
                  'Introduza a periodicidade do pagamento do prémio:',
                  TextAlignment.left);
              String? periodicidadePag =
                  gv.console.readLine(cancelOnBreak: true);
              if (periodicidadePag != null) {
                alteraApolice.periodicidadePag =
                    int.parse(periodicidadePag.toString());
              }
            }
            break;
          case "6":
            {
              gv.console.writeLine(
                  'Introduza o valor do prémio:', TextAlignment.left);
              String? valorPremio = gv.console.readLine(cancelOnBreak: true);
              if (valorPremio != null) {
                alteraApolice.valorPremio =
                    double.parse(valorPremio.toString());
              }
            }
            break;
          case "7":
            {
              gv.console
                  .writeLine('Introduza o valor segurado:', TextAlignment.left);
              String? valorSegurado = gv.console.readLine(cancelOnBreak: true);
              if (valorSegurado != null) {
                alteraApolice.valorSegurado =
                    double.parse(valorSegurado.toString());
              }
            }
            break;
          case "8":
            {
              gv.console.writeLine(
                  'Introduza o Status da apólice (0 - Inativo | 1 - Ativo):',
                  TextAlignment.left);
              String? descStatus = gv.console.readLine(cancelOnBreak: true);
              if (descStatus != null) {
                alteraApolice.status = int.parse(descStatus.toString());
              }
            }
            break;
          case "9":
            {
              terminar = 1;
            }
            break;
          default:
            {
              print("Opção Inválida!");
            }
        }
        gv.apolices.setApolice(numIdApolice, alteraApolice);
        gv.console.clearScreen();
        printApolicesList();
      } while (terminar == 0);
    }
  } on FormatException catch (e) {
    gv.setWarningColors();
    gv.console.writeLine("A idade tem que ser um número", TextAlignment.left);
    gv.console.resetColorAttributes();
    sleep(const Duration(seconds: 2));
  } on Exception catch (e) {
    gv.console.writeLine(e, TextAlignment.left);
    sleep(const Duration(seconds: 3));
  }
}

void eliminarApolice() {
  gv.console.writeLine('ID da Apólice a eliminar: ', TextAlignment.left);
  String? apoliceID = gv.console.readLine(cancelOnBreak: true);
  if (apoliceID != null && apoliceID.isNotEmpty) {
    try {
      gv.apolices.deleteApolice(int.parse(apoliceID));
    } on DadosComRegistosNasApolices catch (e) {
      gv.console.setForegroundColor(ConsoleColor.red);
      gv.console.setBackgroundColor(ConsoleColor.black);
      gv.console.writeLine(e.errorMessage(), TextAlignment.left);
      sleep(const Duration(seconds: 2));
      gv.console.resetColorAttributes();
    }
  }
}
