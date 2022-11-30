import '../models/seguradora_class.dart';
import 'package:perg3/global_variables.dart' as gv;

class Seguradoras {
//variables
  List<Seguradora> _seguradoras = [];

  List<Seguradora> get list => _seguradoras;

  void add(Seguradora seguradora) {
    _seguradoras.add(seguradora);
  }

  getSeguradorainfo() {
    var seguradoraInfo = [];
    _seguradoras.forEach((element) {
      seguradoraInfo.add([
        element.nome,
        gv.apolices.getMediaValorsegurado(element.idSeguradora)
      ]);
    });
    return seguradoraInfo;
  }
}
