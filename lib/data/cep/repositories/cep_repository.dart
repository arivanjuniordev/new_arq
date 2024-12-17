import 'package:new_arq/core/result.dart';
import 'package:new_arq/domain/cep/dto/cep_dto.dart';
import 'package:new_arq/domain/cep/entity/cep_entity.dart';

abstract class CepRepository {
  Future<Result<CepEntity>> getGet(CepDto cep);
}
