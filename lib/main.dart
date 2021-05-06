import 'package:busca_cnpj/screens/home_page.dart';
import 'package:flutter/material.dart';

main() => runApp(BuscaCNPJApp());

class BuscaCNPJApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca CNPJ',
      home: HomePage(),
    );
  }
}
