import 'package:flutter/material.dart';
import 'package:sport_profile_208415/services/services.dart';

import '../models/models.dart';

class StatsProvider extends ChangeNotifier {
  final MatchesService _matchesService;

  int _profileId = 0;

  final List<MatchModel> _lastMatches = [];

  final List<MatchModel> _matches = [];

  StatsProvider(this._matchesService);

  List<int> get matchResults => _lastMatches
      .map(
        (e) => e.scoreA > e.scoreB
            ? 1
            : e.scoreA < e.scoreB
            ? 2
            : 1,
      )
      .toList();

  int get won => _matches.where((e) => e.scoreA > e.scoreB).length;

  int get lost => _matches.where((e) => e.scoreA < e.scoreB).length;

  int get draw => _matches.where((e) => e.scoreA == e.scoreB).length;

  int get matchesCount => _matches.length;

  int get wins => _matches.where((e) => e.scoreA > e.scoreB).length;

  int get pointsScored => _matches.isEmpty
      ? 0
      : _matches.map((e) => e.scoreA).reduce((a, b) => a + b);

  int get pointsAllowed => _matches.isEmpty
      ? 0
      : _matches.map((e) => e.scoreB).reduce((a, b) => a + b);

  int get touchdowns => _matches.isEmpty
      ? 0
      : _matches.map((e) => e.stats[0]).reduce((a, b) => a + b);

  int get fieldGoals => _matches.isEmpty
      ? 0
      : _matches.map((e) => e.stats[14]).reduce((a, b) => a + b);

  List<int> get stats => [pointsScored, pointsAllowed, touchdowns, fieldGoals];

  void setProfile(int profileId) async {
    _matches.clear();
    _lastMatches.clear();
    _profileId = profileId;
    final list = await _matchesService.getMatches(_profileId);

    for (var match in list) {
      if (match.isOver) {
        if (_lastMatches.length < 7) _lastMatches.add(match);
        _matches.add(match);
      }
    }

    notifyListeners();
  }

  void updateMatches() async {
    _matches.clear();
    _lastMatches.clear();
    final list = await _matchesService.getMatches(_profileId);

    for (var match in list) {
      if (match.isOver) {
        if (_lastMatches.length < 7) _lastMatches.add(match);
        _matches.add(match);
      }
    }

    notifyListeners();
  }
}
