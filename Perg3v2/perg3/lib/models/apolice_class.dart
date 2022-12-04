class Apolice {
  int id_apolice;
  int id_seguradora;
  int id_tomador;
  int id_segurado;
  int id_tipoSeguro;
  double valorSegurado;
  double valorPremio;
  int periodicidadePag;
  int status;

  Apolice(
      this.id_apolice,
      this.id_segurado,
      this.id_seguradora,
      this.id_tipoSeguro,
      this.periodicidadePag,
      this.status,
      this.id_tomador,
      this.valorPremio,
      this.valorSegurado);

  Apolice.vazio()
      : id_apolice = 0,
        id_segurado = 0,
        id_seguradora = 0,
        id_tipoSeguro = 0,
        periodicidadePag = 0,
        status = 0,
        id_tomador = 0,
        valorPremio = 0,
        valorSegurado = 0;
}
