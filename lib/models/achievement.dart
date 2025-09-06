import 'dart:convert';

import 'models.dart';

class Achievement {
  final int id;
  final int profileId;
  final String title;
  final String description;
  final int xp;
  final Cup cup;
  final bool isAchieved;

  Achievement({
    required this.id,
    required this.profileId,
    required this.title,
    required this.description,
    required this.xp,
    required this.cup,
    this.isAchieved = false,
  });

  Achievement copyWith({
    int? id,
    int? profileId,
    String? title,
    String? description,
    int? xp,
    Cup? cup,
    bool? isAchieved,
  }) {
    return Achievement(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      title: title ?? this.title,
      description: description ?? this.description,
      xp: xp ?? this.xp,
      cup: cup ?? this.cup,
      isAchieved: isAchieved ?? this.isAchieved,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'profile_id': profileId,
      'title': title,
      'description': description,
      'xp': xp,
      'cup': jsonEncode(cup.toMap()),
      'is_achieved': isAchieved ? 1 : 0,
    };
  }

  factory Achievement.fromMap(Map<String, dynamic> map) {
    return Achievement(
      id: map['id'] as int,
      profileId: map['profile_id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      xp: map['xp'] as int,
      cup: Cup.fromMap(jsonDecode(map['cup']) as Map<String, dynamic>),
      isAchieved: map['is_achieved'] == 1,
    );
  }
}
