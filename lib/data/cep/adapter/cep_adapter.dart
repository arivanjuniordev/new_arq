import 'package:new_arq/domain/cep/entity/cep_entity.dart';

class Cepadapter {
  static CepEntity fromJson(Map<String, dynamic> json) {
    return CepEntity(
      cep: json['cep'],
      logradouro: json['logradouro'],
      complemento: json['complemento'],
      bairro: json['bairro'],
      localidade: json['localidade'],
      uf: json['uf'],
      unidade: json['unidade'],
      estado: json['estado'],
      regiao: json['regiao'],
      ibge: json['ibge'],
      gia: json['gia'],
      ddd: json['ddd'],
      siafi: json['siafi'],
    );
  }
}
