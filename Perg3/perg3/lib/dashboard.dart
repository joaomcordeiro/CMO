import 'package:perg3/data/apolices.dart';
import 'package:perg3/data/data_input.dart';
import 'package:perg3/relatorio_apolices.dart';
import 'package:perg3/global_variables.dart' as gv;
import 'package:dart_console/dart_console.dart';
import 'dart:io';

void dashboard() {
  gv.console.setBackgroundColor(ConsoleColor.blue);
  gv.console.setForegroundColor(ConsoleColor.white);
  gv.console.clearScreen;
  gv.console.writeLine('Apólices ', TextAlignment.center);
  var info = [
    ["Apólices Ativas", gv.apolices.getNumApolicesAtivas()],
    ["Apólices Inativas", gv.apolices.getNumApolicesInativas()]
  ];
  final table = Table()
    ..insertColumn(header: '', alignment: TextAlignment.left)
    ..insertColumn(header: 'Número', alignment: TextAlignment.left)
    ..insertRows(info)
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.brightBlue
    ..borderType = BorderType.vertical
    ..headerStyle = FontStyle.bold;
  gv.console.write(table);
//Por seguradora: Quantidade e valor médio segurado (só Ativas)
  gv.console.writeLine('Apólices ', TextAlignment.center);
  var segur = [
    ["Apólices Ativas", gv.apolices.getNumApolicesAtivas()],
    ["Apólices Inativas", gv.apolices.getNumApolicesInativas()]
  ];
  final tableSegur = Table()
    ..insertColumn(header: '', alignment: TextAlignment.left)
    ..insertColumn(header: 'Número', alignment: TextAlignment.left)
    ..insertRows(segur)
    ..borderStyle = BorderStyle.rounded
    ..borderColor = ConsoleColor.brightBlue
    ..borderType = BorderType.vertical
    ..headerStyle = FontStyle.bold;
  gv.console.write(tableSegur);
}
