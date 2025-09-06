import 'dart:convert';

class Profile {
  final int id;
  String? name;
  String? pos;
  String? image;
  int? age;
  int? nat;
  int? height;
  int? weight;
  String? teamName;
  String? teamLogo;
  List<int> stats;

  Profile({
    required this.id,
    this.name,
    this.pos,
    this.image,
    this.age,
    this.nat,
    this.height,
    this.weight,
    this.teamName,
    this.teamLogo,
    required this.stats,
  });

  factory Profile.empty() =>
      Profile(id: -1, name: '', stats: [125, 125, 125, 125, 125]);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name ?? '',
      'pos': pos ?? '',
      'image': image ?? '',
      'age': age ?? -1,
      'nat': nat ?? -1,
      'height': height ?? -1,
      'weight': weight ?? -1,
      'team_name': teamName ?? '',
      'team_logo': teamLogo ?? '',
      'stats': jsonEncode(stats),
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    final statsJson = jsonDecode(map['stats']) as List<dynamic>;
    final stats = List<int>.from(statsJson.map((e) => e as int));
    return Profile(
      id: map['id'] as int,
      name: (map['name'] as String).isEmpty ? null : map['name'] as String,
      pos: (map['pos'] as String).isEmpty ? null : map['pos'] as String,
      image: (map['image'] as String).isEmpty ? null : map['image'] as String,
      age: (map['age'] as int) == -1 ? null : map['age'] as int,
      nat: (map['nat'] as int) == -1 ? null : map['nat'] as int,
      height: (map['height'] as int) == -1 ? null : map['height'] as int,
      weight: (map['weight'] as int) == -1 ? null : map['weight'] as int,
      teamName: (map['team_name'] as String).isEmpty
          ? null
          : map['team_name'] as String,
      teamLogo: (map['team_logo'] as String).isEmpty
          ? null
          : map['team_logo'] as String,
      stats: stats,
    );
  }
}
