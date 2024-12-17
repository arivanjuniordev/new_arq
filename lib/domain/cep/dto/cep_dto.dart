class CepDto {
  final String cep;

  const CepDto({
    required this.cep,
  });

  CepDto copyWith({
    String? cep,
  }) {
    return CepDto(
      cep: cep ?? this.cep,
    );
  }
}
