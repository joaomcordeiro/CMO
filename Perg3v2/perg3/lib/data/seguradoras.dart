import '../models/seguradora_class.dart';
import '../exceptions/dados_com_registos_nas_apolices.dart';
import 'package:perg3/global_variables.dart' as gv;

class Seguradoras {
//variables
  final List<Seguradora> _seguradoras = [];

  List<Seguradora> get list => _seguradoras;

  void add(Seguradora seguradora) {
    _seguradoras.add(seguradora);
  }

  String getSeguradoraName(int numberID) {
    return _seguradoras
        .where((element) => element.idSeguradora == (numberID))
        .first
        .nome
        .toString();
  }

//devolve uma lista de objetos com informação para o dashboard
  List<List<Object>> getSeguradorainfo() {
    List<List<Object>> seguradoraInfo = [];
    _seguradoras.forEach((element) {
      List<Object> info =
          gv.apolices.getSeguradoraMediaValorsegurado(element.idSeguradora);
      seguradoraInfo.add([element.nome, info[0], info[1]]);
    });
    return seguradoraInfo;
  }

  List<Object> getSeguradorasList() {
    List<Object> temp = _seguradoras;
    return temp;
  }

  void setNomeSeguradora(int numberID, String novoNome) {
    _seguradoras
        .where((element) => element.idSeguradora == (numberID))
        .first
        .nome = novoNome;
  }

  void deleteSeguradora(int numberID) {
    //you cannot delete a Seguradora if is it used in Apolices
    gv.apolices.list.where((element) => element.id_seguradora == numberID);
    if (gv.apolices.list.any((element) => element.id_seguradora == numberID)) {
      throw DadosComRegistosNasApolices(numberID.toString(), "A Seguradora");
    }
    _seguradoras.removeWhere((element) => element.idSeguradora == numberID);
  }
}
