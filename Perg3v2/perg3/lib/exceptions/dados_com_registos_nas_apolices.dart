class DadosComRegistosNasApolices implements Exception {
  final String _item;
  final String _modulo;

  DadosComRegistosNasApolices(this._item, this._modulo);

  String errorMessage() => "$_modulo $_item tem apólices associadas";
}
