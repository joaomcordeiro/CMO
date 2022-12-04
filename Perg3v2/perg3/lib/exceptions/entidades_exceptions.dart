class EntidadeCampoVazio implements Exception {
  final String _campo;

  EntidadeCampoVazio(this._campo);

  String errorMessage() => "O $_campo não pode ser vazio.";
}
