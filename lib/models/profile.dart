import 'dart:convert';

import 'package:sport_profile_208415/models/models.dart';
import 'package:sport_profile_208415/utils/utils.dart';

class Profile {
  final int id;
  String? name;
  String? pos;
  String? image;
  int? age;
  Nationality nat;
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
    required this.nat,
    this.height,
    this.weight,
    this.teamName,
    this.teamLogo,
    required this.stats,
  });

  factory Profile.empty() => Profile(
    id: -1,
    name: 'Player #1',
    nat: nationalities[0],
    stats: [125, 125, 125, 125, 125],
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name ?? '',
      'pos': pos ?? '',
      'image': image ?? '',
      'age': age ?? -1,
      'nat': nat.id,
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
    final natId = (map['nat'] as int) == -1 ? null : map['nat'] as int;
    final nat = nationalities.firstWhere((element) => element.id == natId);
    return Profile(
      id: map['id'] as int,
      name: (map['name'] as String).isEmpty ? null : map['name'] as String,
      pos: (map['pos'] as String).isEmpty ? null : map['pos'] as String,
      image: (map['image'] as String).isEmpty ? null : map['image'] as String,
      age: (map['age'] as int) == -1 ? null : map['age'] as int,
      nat: nat,
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

  Profile copyWith({
    int? id,
    String? name,
    String? pos,
    String? image,
    int? age,
    Nationality? nat,
    int? height,
    int? weight,
    String? teamName,
    String? teamLogo,
    List<int>? stats,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      pos: pos ?? this.pos,
      image: image ?? this.image,
      age: age ?? this.age,
      nat: nat ?? this.nat,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      teamName: teamName ?? this.teamName,
      teamLogo: teamLogo ?? this.teamLogo,
      stats: stats ?? this.stats,
    );
  }
}
