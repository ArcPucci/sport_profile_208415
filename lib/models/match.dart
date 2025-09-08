import 'dart:convert';

import 'package:sport_profile_208415/models/models.dart';
import 'package:sport_profile_208415/utils/utils.dart';

class MatchModel {
  final int id;
  final int profileId;
  final MatchType matchType;
  final DateTime created;
  final int duration;
  final String teamA;
  final String teamB;
  final int scoreA;
  final int scoreB;
  final List<int> stats;

  MatchModel({
    required this.id,
    required this.profileId,
    required this.matchType,
    required this.created,
    required this.duration,
    required this.teamA,
    required this.teamB,
    required this.scoreA,
    required this.scoreB,
    required this.stats,
  });

  bool get isOver => created.isBefore(DateTime.now());

  factory MatchModel.empty() => MatchModel(
    id: 0,
    profileId: 0,
    matchType: matchTypes.first,
    created: DateTime.now(),
    duration: 125,
    teamA: 'Team A',
    teamB: 'Team B',
    scoreA: 0,
    scoreB: 0,
    stats: List.generate(16, (index) => 125),
  );

  MatchModel copyWith({
    int? id,
    int? profileId,
    MatchType? matchType,
    DateTime? created,
    int? duration,
    String? teamA,
    String? teamB,
    int? scoreA,
    int? scoreB,
    List<int>? stats,
  }) {
    return MatchModel(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      matchType: matchType ?? this.matchType,
      created: created ?? this.created,
      duration: duration ?? this.duration,
      teamA: teamA ?? this.teamA,
      teamB: teamB ?? this.teamB,
      scoreA: scoreA ?? this.scoreA,
      scoreB: scoreB ?? this.scoreB,
      stats: stats ?? this.stats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'profile_id': profileId,
      'match_type': matchType.id,
      'created': created.microsecondsSinceEpoch,
      'duration': duration,
      'team_a': teamA,
      'team_b': teamB,
      'score_a': scoreA,
      'score_b': scoreB,
      'stats': jsonEncode(stats),
    };
  }

  factory MatchModel.fromMap(Map<String, dynamic> map) {
    final matchTypeId = map['match_type'] as int;
    final matchType = matchTypes.firstWhere(
      (element) => element.id == matchTypeId,
    );
    final statsJson = jsonDecode(map['stats']) as List<dynamic>;
    final stats = statsJson.map((e) => e as int).toList();
    return MatchModel(
      id: map['id'] as int,
      profileId: map['profile_id'] as int,
      matchType: matchType,
      created: DateTime.fromMicrosecondsSinceEpoch(map['created'] as int),
      duration: map['duration'] as int,
      teamA: map['team_a'] as String,
      teamB: map['team_b'] as String,
      scoreA: map['score_a'] as int,
      scoreB: map['score_b'] as int,
      stats: stats,
    );
  }
}
