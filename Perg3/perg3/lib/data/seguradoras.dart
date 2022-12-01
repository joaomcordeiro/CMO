import '../models/seguradora_class.dart';
import 'package:perg3/global_variables.dart' as gv;

class Seguradoras {
//variables
  List<Seguradora> _seguradoras = [];

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
}
