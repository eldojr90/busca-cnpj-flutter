import 'package:busca_cnpj/main.dart';
import 'package:busca_cnpj/services/busca_cnpj_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _cnpj = '';
  Future<dynamic> empresa;

  void _getDados(cnpjPesquisa) {
    setState(() {
      if (this._cnpj.length == 14) {
        empresa = BuscaCnpjService.getDadosEmpresa(cnpjPesquisa);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Busca CNPJ'),
      ),
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (input) {
                    _cnpj = input;
                    _getDados(_cnpj);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'CNPJ',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: FutureBuilder(
                    future: empresa,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var objEmpresa = snapshot.data;
                        var text =
                            '${objEmpresa.razaoSocial} \n${objEmpresa.logradouro}, ${objEmpresa.numero}';
                        text +=
                            '\n${objEmpresa.bairro}, ${objEmpresa.municipio}-${objEmpresa.uf}';
                        print(objEmpresa.razaoSocial);

                        return Text(text);
                      }

                      if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      return Container();
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
