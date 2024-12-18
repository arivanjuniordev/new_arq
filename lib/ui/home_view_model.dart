import 'package:flutter/material.dart';
import 'package:new_arq/core/command.dart';
import 'package:new_arq/core/result.dart';
import 'package:new_arq/data/cep/repositories/cep_repository_remote.dart';
import 'package:new_arq/domain/cep/dto/cep_dto.dart';
import 'package:new_arq/domain/cep/entity/cep_entity.dart';

class HomeViewModel extends ChangeNotifier {
  final CepRepositoryRemote _cepRepositoryRemote;

  HomeViewModel(this._cepRepositoryRemote) {
    getCep = Command1<void, String>(_getCep);
  }
  
  late Command1<void, String> getCep;

  Address? _cepEntity;
  Address? get cepEntity => _cepEntity;

  Future<Result> _getCep(String cep) async {
    final result = await _cepRepositoryRemote.getGet(Cep(cep: cep));

    switch (result) {
      case Ok<CepEntity>():
        _cepEntity = result.value;

      case Error<CepEntity>():
        print('Error');
    }

    notifyListeners();
    return result;
  }
}
