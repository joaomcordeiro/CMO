import '../models/entidade_class.dart';
import 'package:perg3/global_variables.dart' as gv;

class Entidades {
//variables
  List<Entidade> _entidades = [];

  List<Entidade> get list => _entidades;

  void add(Entidade entidade) {
    _entidades.add(entidade);
  }

  String getEntidadeNome(number) {
    return _entidades
        .where((element) => element.idEntidade == (number - 1))
        .first
        .nome;
  }

  int getEntidadeIdade(number) {
    return _entidades
        .where((element) => element.idEntidade == (number - 1))
        .first
        .idade;
  }

  String getEntidadeMorada(number) {
    return _entidades
        .where((element) => element.idEntidade == (number - 1))
        .first
        .morada;
  }
}
