// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:new_arq/core/result.dart';
import 'package:new_arq/data/cep/repositories/cep_repository.dart';
import 'package:new_arq/data/cep/services/cep_service.dart';
import 'package:new_arq/domain/cep/dto/cep_dto.dart';
import 'package:new_arq/domain/cep/entity/cep_entity.dart';

class CepRepositoryRemote implements CepRepository {
  final CepService cepService;

  const CepRepositoryRemote({
    required this.cepService,
  });

  @override
  Future<Result<CepEntity>> getGet(CepDto dto) async {
    try {
      final result = await cepService.getCep(dto.cep);
      return Result.ok(result);
    } catch (e) {
      return Result.error(Exception('Erro ao buscar o CEP'));
    }
  }
}
