class Cep {
  final String cep;

  const Cep({
    required this.cep,
  });

  Cep copyWith({
    String? cep,
  }) {
    return Cep(
      cep: cep ?? this.cep,
    );
  }
}
