class Empresa {
  final String razaoSocial;
  final String logradouro;
  final String numero;
  final String bairro;
  final String municipio;
  final String uf;
  String cnpj;

  Empresa(
      {this.razaoSocial,
      this.logradouro,
      this.numero,
      this.bairro,
      this.municipio,
      this.uf});

  factory Empresa.fromJson(Map<String, dynamic> json) {
    return Empresa(
      razaoSocial: json['nome'],
      logradouro: json['logradouro'],
      numero: json['numero'],
      bairro: json['bairro'],
      municipio: json['municipio'],
      uf: json['uf'],
    );
  }
}
