import 'package:perg3/exceptions/entidades_exceptions.dart';
import '../exceptions/dados_com_registos_nas_apolices.dart';

import '../models/entidade_class.dart';
import 'package:perg3/global_variables.dart' as gv;

class Entidades {
//variables
  List<Entidade> _entidades = [];

  List<Entidade> get list => _entidades;

  void add(Entidade entidade) {
    if (entidade.nome.isEmpty) {
      throw EntidadeCampoVazio("Nome");
    }
    if (entidade.morada.isEmpty) {
      throw EntidadeCampoVazio("Morada");
    }
    _entidades.add(entidade);
  }

  String getEntidadeNome(number) {
    return _entidades
        .where((element) => element.idEntidade == (number))
        .first
        .nome;
  }

  int getEntidadeIdade(number) {
    return _entidades
        .where((element) => element.idEntidade == (number))
        .first
        .idade;
  }

  String getEntidadeMorada(number) {
    return _entidades
        .where((element) => element.idEntidade == (number))
        .first
        .morada;
  }

  void setEntidade(int entidadeID, Entidade alteraEntidade) {
    _entidades.removeWhere((element) => element.idEntidade == entidadeID);
    gv.entidades.add(alteraEntidade);
    _entidades.sort((a, b) => a.idEntidade.compareTo(b.idEntidade));
  }

  void deleteEntidade(int entidadeID) {
    //you cannot delete a Entidade if is it used in Apolices
    // gv.apolices.list.where((element) => element.id_tipoSeguro == numberID);
    if (gv.apolices.list
        .any((element) => element.id_tipoSeguro == entidadeID)) {
      throw DadosComRegistosNasApolices(entidadeID.toString(), "A Entidade");
    }
    _entidades.removeWhere((element) => element.idEntidade == entidadeID);
    _entidades.sort((a, b) => a.idEntidade.compareTo(b.idEntidade));
  }
}
