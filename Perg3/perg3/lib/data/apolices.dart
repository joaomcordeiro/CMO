import '../models/apolice_class.dart';

class Apolices {
//variables
  List<Apolice> _apolices = [];

  List<Apolice> get list => _apolices;

  void add(Apolice apolice) {
    _apolices.add(apolice);
  }
}
