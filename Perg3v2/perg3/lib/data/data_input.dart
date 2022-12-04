import 'package:perg3/models/entidade_class.dart';
import 'package:perg3/models/seguradora_class.dart';
import 'package:perg3/models/tipo_seguro_class.dart';
import '../models/apolice_class.dart';
import 'package:perg3/global_variables.dart' as gv;

void dataInput() {
  gv.apolices.add(Apolice(1, 1, 1, 1, 1, 1, 1, 200, 18000));
  gv.apolices.add(Apolice(2, 3, 3, 1, 6, 1, 2, 60, 25000));
  gv.apolices.add(Apolice(3, 4, 2, 3, 1, 0, 1, 35, 2500));
  gv.apolices.add(Apolice(4, 3, 1, 2, 1, 1, 2, 24, 3600));
  gv.apolices.add(Apolice(5, 3, 3, 4, 12, 1, 5, 545, 36000));
  gv.apolices.add(Apolice(6, 4, 2, 3, 6, 1, 4, 368, 24000));
  gv.apolices.add(Apolice(7, 5, 3, 3, 3, 0, 5, 478, 36000));
  gv.apolices.add(Apolice(8, 4, 4, 4, 12, 1, 2, 784, 44000));
  gv.apolices.add(Apolice(9, 2, 3, 2, 6, 1, 4, 125, 30000));
  gv.apolices.add(Apolice(10, 4, 4, 4, 12, 1, 4, 650, 45000));
  gv.entidades.add(Entidade(1, "André Filipe Costa Silva", 26,
      "Rua dos Calores, 354 - 4435 Rio Tinto"));
  gv.entidades.add(Entidade(2, "Maria José Rocha", 31,
      "Travessa das caldas, 32 R/C Esq - 2100 Lisboa"));
  gv.entidades.add(Entidade(
      3, "Vitor Martins", 47, "Largo do escondidinho, 21 - 2300 Lisboa"));
  gv.entidades.add(Entidade(
      4, "Carla Alberta dos Santos", 38, "Praça da alegria, 677 - 4200 Porto"));
  gv.entidades.add(Entidade(5, "Helena Cristina Machado", 24,
      "Avenida da liberdade, 445 -2000 Lisboa"));
  gv.seguradoras.add(Seguradora(1, "Liberty"));
  gv.seguradoras.add(Seguradora(2, "AGS"));
  gv.seguradoras.add(Seguradora(3, "Fidelidade"));
  gv.seguradoras.add(Seguradora(4, "AGEAS"));
  gv.tiposSeguro.add(TipoSeguro(1, "Vida"));
  gv.tiposSeguro.add(TipoSeguro(2, "Acidentes pessoais"));
  gv.tiposSeguro.add(TipoSeguro(3, "Saúde"));
  gv.tiposSeguro.add(TipoSeguro(4, "Automóvel"));
}
