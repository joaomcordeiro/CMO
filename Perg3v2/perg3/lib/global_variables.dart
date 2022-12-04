import 'package:dart_console/dart_console.dart';
import 'package:perg3/data/entidades.dart';
import 'package:perg3/data/apolices.dart';
import 'package:perg3/data/seguradoras.dart';
import 'package:perg3/data/tipos_seguro.dart';

import 'package:perg3/data/data_input.dart';

final console = Console();
Apolices apolices = Apolices();
Entidades entidades = Entidades();
Seguradoras seguradoras = Seguradoras();
TiposSeguro tiposSeguro = TiposSeguro();

void setForeBackgroundRedBlack() {
  console.setForegroundColor(ConsoleColor.red);
  console.setBackgroundColor(ConsoleColor.black);
}

void setForeBackgroundWhitBlue() {
  console.setForegroundColor(ConsoleColor.white);
  console.setBackgroundColor(ConsoleColor.blue);
}

void setForeBackgroundWhiteGreen() {
  console.setForegroundColor(ConsoleColor.brightWhite);
  console.setBackgroundColor(ConsoleColor.brightCyan);
}

void setTableColors() {
  console.setForegroundColor(ConsoleColor.brightWhite);
  console.setBackgroundColor(ConsoleColor.brightCyan);
}

void setPageTitleColors() {
  console.setForegroundColor(ConsoleColor.brightWhite);
  console.setBackgroundColor(ConsoleColor.blue);
}

void setOptionsColors() {
  console.setForegroundColor(ConsoleColor.brightYellow);
  console.setBackgroundColor(ConsoleColor.blue);
}
