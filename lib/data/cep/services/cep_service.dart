import 'package:dio/dio.dart';
import 'package:new_arq/data/cep/adapter/cep_adapter.dart';
import 'package:new_arq/domain/cep/entity/cep_entity.dart';

class CepService {
  final Dio htppClient;

  const CepService({
    required this.htppClient,
  });

  Future<CepEntity> getCep(String cep) async {
    await Future.delayed(const Duration(seconds: 2));
    try{ 
      final response =
          await htppClient.get('https://viacep.com.br/ws/$cep/json/');
      
      final data = Cepadapter.fromJson(response.data);

      return Result.ok(data);
    } catch(e) {
      return Result.error(data);
    }
  }
}
