class Entidade {
  int idEntidade;
  String nome;
  int idade;
  String morada;

  Entidade(this.idEntidade, this.nome, this.idade, this.morada);

  Entidade.vazio()
      : idEntidade = 0,
        nome = "",
        idade = 0,
        morada = "";
}
