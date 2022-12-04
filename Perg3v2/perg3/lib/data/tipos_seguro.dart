import '../models/tipo_seguro_class.dart';
import 'package:perg3/global_variables.dart' as gv;
import '../exceptions/dados_com_registos_nas_apolices.dart';

class TiposSeguro {
//variables
  List<TipoSeguro> _tiposSeguro = [];

  List<TipoSeguro> get list => _tiposSeguro;

  void add(TipoSeguro tipoSeguro) {
    _tiposSeguro.add(tipoSeguro);
  }

  String getTipoSeguro(int numberID) {
    return _tiposSeguro
        .where((element) => element.idTipoSeguro == (numberID))
        .first
        .tipo
        .toString();
  }

  List<List<Object>> getTiposSeguroinfo(String destinatario) {
    List<List<Object>> tiposSeguroInfo = [];
    _tiposSeguro.forEach((element) {
      List<Object> info = gv.apolices
          .getTipoSeguroMediaValorsegurado(element.idTipoSeguro, destinatario);
      switch (destinatario) {
        case "dashboard":
          {
            tiposSeguroInfo.add([element.tipo, info[0], info[1]]);
          }
          break;
        case "relatorioapolices":
          {
            for (var i = 0; i <= (info.length - 1); i += 3) {
              tiposSeguroInfo
                  .add([element.tipo, info[i], info[i + 1], info[i + 2]]);
            }
          }
          break;
        default:
          {
            print("Entrada Inválida!");
          }
          break;
      }
    });
    return tiposSeguroInfo;
  }

  void setTipoSeguro(int numberID, String novoTipo) {
    _tiposSeguro
        .where((element) => element.idTipoSeguro == (numberID))
        .first
        .tipo = novoTipo;
  }

  void deleteTipoSeguro(int numberID) {
    //you cannot delete a Seguradora if is it used in Apolices
    // gv.apolices.list.where((element) => element.id_tipoSeguro == numberID);
    if (gv.apolices.list.any((element) => element.id_tipoSeguro == numberID)) {
      throw DadosComRegistosNasApolices(
          numberID.toString(), "O Tipo de Seguro");
    }
    _tiposSeguro.removeWhere((element) => element.idTipoSeguro == numberID);
  }
}
