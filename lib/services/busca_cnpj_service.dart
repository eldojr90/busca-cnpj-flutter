import 'dart:convert';

import 'package:busca_cnpj/models/empresa.dart';
import 'package:http/http.dart' as http;

class BuscaCnpjService {
  static Future<Empresa> getDadosEmpresa(String cnpj) async {
    if (cnpj.length == 14) {
      final response =
          await http.get('https://www.receitaws.com.br/v1/cnpj/$cnpj');
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return Empresa.fromJson(json);
      } else if (response.statusCode == 429) {
        throw Exception('Excesso de requisições, tente mais tarde.');
      } else if (response.statusCode == 404) {
        throw Exception('CNPJ não cadastrado');
      } else {
        throw Exception('Erro na API ReceitaWS');
      }
    }
  }
}
