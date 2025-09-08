import 'package:flutter/material.dart';
import 'package:sport_profile_208415/services/services.dart';
import 'package:sport_profile_208415/utils/datetime_extensions.dart';
import 'package:sport_profile_208415/utils/utils.dart';

import '../models/models.dart';

class MatchesProvider extends ChangeNotifier {
  final MatchesService _matchesService;

  MatchesProvider(this._matchesService);

  int _selectedProfile = -1;

  int get selectedProfile => _selectedProfile;

  DateTime _dateTime = DateTime.now();

  DateTime get dateTime => _dateTime;

  List<MatchModel> _matches = [];

  List<MatchModel> get matches => _matches;

  MatchModel _matchModel = MatchModel.empty();

  MatchModel get matchModel => _matchModel;

  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  List<String> _filters = [];

  List<String> get filters => _filters;

  void setProfileId(int profileId) async {
    _selectedProfile = profileId;
    _updateMatches();
  }

  void selectModel(MatchModel model) {
    _matchModel = model;
  }

  void _updateMatches() async {
    final matches = await _matchesService.getMatches(_selectedProfile);
    if (_selectedTab == 0) {
      _matches = matches.where((e) => !e.isOver).toList();
    } else {
      _matches = matches.where((e) => e.isOver).toList();
    }

    final now = _dateTime.withZeroTime;
    _matches.removeWhere((e) => !e.created.withZeroTime.isAtSameMomentAs(now));

    if (_filters.isNotEmpty) {
      final Set list = {};

      for (var match in _matches) {
        if (_filters.contains(match.matchType.name)) {
          list.add(match);
        }
        if (_filters.contains(victoryTypes[0]) && match.scoreA > match.scoreB) {
          list.add(match);
        }
        if (_filters.contains(victoryTypes[1]) && match.scoreA < match.scoreB) {
          list.add(match);
        }
        if (_filters.contains(victoryTypes[2]) &&
            match.scoreA == match.scoreB) {
          list.add(match);
        }
      }

      print(list);

      _matches = List.from(list);
    }

    notifyListeners();
  }

  void selectTab(int tab) {
    _selectedTab = tab;
    _updateMatches();
  }

  void saveMatch(MatchModel match) async {
    _matchModel = match;
    await _matchesService.updateMatch(match);
    _updateMatches();
  }

  void createMatch(MatchModel match) async {
    await _matchesService.createMatch(match);
    _updateMatches();
  }

  void changedDatetime(DateTime date) {
    _dateTime = date;
    _updateMatches();
  }

  void changeDate(int year, int month) {
    _dateTime = DateTime(year, month);
    _updateMatches();
  }

  void deleteMatchById(MatchModel match) {
    _matchesService.deleteMatch(match.id);
    _updateMatches();
  }

  void deleteMatch() {
    _matchesService.deleteMatch(_matchModel.id);
    _updateMatches();
  }

  void addFilter(String filter) {
    if (_filters.contains(filter)) return;
    _filters.add(filter);
    notifyListeners();
    _updateMatches();
  }

  void removeFilter(String filter) {
    _filters.remove(filter);
    notifyListeners();
    _updateMatches();
  }

  void resetFilters() {
    _filters = [];
    notifyListeners();
    _updateMatches();
  }
}
