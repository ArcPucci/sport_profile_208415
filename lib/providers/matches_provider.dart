import 'package:flutter/material.dart';
import 'package:sport_profile_208415/providers/providers.dart';
import 'package:sport_profile_208415/services/services.dart';

class MatchesProvider extends ChangeNotifier {
  final MatchesService _matchesService;

  MatchesProvider(this._matchesService);

  int _selectedProfile = -1;
}