import '../models/apolice_class.dart';

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

  double getMediaValorsegurado(idSeguradora) {
    //devolve a média do valor segurado por seguradora
    double mediaValor = 0;
    Iterable<Apolice> getFiltermembers = _apolices.where((element) =>
        element.id_seguradora == idSeguradora || element.status == 1);
    getFiltermembers.forEach((element) {
      mediaValor = mediaValor + element.valorSegurado.toInt();
    });
    mediaValor = mediaValor / getFiltermembers.length;
    return mediaValor;
  }
}
