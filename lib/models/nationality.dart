class Nationality {
  final int id;
  final String name;
  final String asset;

  Nationality({required this.id, required this.name, required this.asset});

  factory Nationality.empty() =>
      Nationality(id: -1, name: '', asset: 'assets/png/flag2.png');
}
