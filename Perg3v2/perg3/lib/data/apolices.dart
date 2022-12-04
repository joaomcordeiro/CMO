import 'package:perg3/exceptions/dados_com_registos_nas_apolices.dart';
import '../models/apolice_class.dart';
import 'package:perg3/global_variables.dart' as gv;

class Apolices {
//variables
  List<Apolice> _apolices = [];

  List<Apolice> get list => _apolices;

  void add(Apolice apolice) {
    _apolices.add(apolice);
  }

  int getNumApolicesAtivas() {
    return _apolices.where((element) => element.status == 1).length;
  }

  int getNumApolicesInativas() {
    return _apolices.where((element) => element.status == 0).length;
  }

  List<Object> getSeguradoraMediaValorsegurado(idSeguradora) {
    //devolve a média do valor segurado por seguradora e a quantidade de seguros ativos
    double mediaValor = 0;
    List<Object> info = [];
    Iterable<Apolice> getFiltermembers = _apolices.where((element) =>
        element.id_seguradora == idSeguradora && element.status == 1);
    getFiltermembers.forEach((element) {
      mediaValor = mediaValor + element.valorSegurado.toInt();
    });
    info.add(getFiltermembers.length);
    info.add((mediaValor / getFiltermembers.length).toStringAsFixed(2));
    return info;
  }

//Dependendo do destinatátio da informação, devolve a média do valor segurado por tipo de seguro e a quantidade de seguros ativos, se for para o Dashboard
// ou seguradora e valor anual de prémios, se for para o Relatório de Apólices
  List<Object> getTipoSeguroMediaValorsegurado(
      idTipoSeguro, String destinatario) {
    double mediaValor = 0;
    List<Object> info = [];
    Iterable<Apolice> getFiltermembers = _apolices.where((element) =>
        element.id_tipoSeguro == idTipoSeguro && element.status == 1);
    switch (destinatario) {
      case "dashboard":
        {
          getFiltermembers.forEach((element) {
            mediaValor = mediaValor + element.valorSegurado.toInt();
          });
          info.add(getFiltermembers.length);
          info.add((mediaValor / getFiltermembers.length).toStringAsFixed(2));
        }
        break;

      case "relatorioapolices":
        {
          getFiltermembers
              .toList()
              .sort((a, b) => a.id_seguradora.compareTo(b.id_seguradora));
          getFiltermembers.forEach((element) {
            info.add(gv.seguradoras.getSeguradoraName(element.id_seguradora));
            info.add(element.id_apolice);
            info.add(element.valorPremio * (12 / element.periodicidadePag));
          });
        }
        break;
      default:
        {
          print("Entrada Inválida!");
        }
        break;
    }

    return info;
  }

  List<List<Object>> getEntidadesApolices() {
    List<List<Object>> info = [];
    _apolices.forEach((e) {
      List<Object> infoApolice = (["Apolice", e.id_apolice]);
      info.add(infoApolice);
      List<Object> infoTomador = ([
        "Tomador",
        gv.entidades.getEntidadeNome(e.id_tomador),
        gv.entidades.getEntidadeIdade(e.id_tomador),
        gv.entidades.getEntidadeMorada(e.id_tomador)
      ]);
      info.add(infoTomador);
      if (e.id_segurado != e.id_tomador) {
        List<Object> infoSegurado = ([
          "Segurado",
          gv.entidades.getEntidadeNome(e.id_segurado),
          gv.entidades.getEntidadeIdade(e.id_segurado),
          gv.entidades.getEntidadeMorada(e.id_segurado)
        ]);
        info.add(infoSegurado);
      }
    });
    return info;
  }

// Utilizado na edição da lista de apolices
  void setApolice(int apoliceID, Apolice alteraApolice) {
    _apolices.removeWhere((element) => element.id_apolice == apoliceID);
    gv.apolices.add(alteraApolice);
    _apolices.sort((a, b) => a.id_apolice.compareTo(b.id_apolice));
  }

  void deleteApolice(int apoliceID) {
    //you cannot delete a Entidade if is it used in Apolices
    // gv.apolices.list.where((element) => element.id_tipoSeguro == numberID);
    if (gv.apolices.list.any((element) => element.id_tipoSeguro == apoliceID)) {
      throw DadosComRegistosNasApolices(apoliceID.toString(), "A Apólice");
    }
    _apolices.removeWhere((element) => element.id_apolice == apoliceID);
    _apolices.sort((a, b) => a.id_apolice.compareTo(b.id_apolice));
  }
}
