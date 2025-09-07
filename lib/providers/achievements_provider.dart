import 'package:flutter/material.dart';
import 'package:sport_profile_208415/models/models.dart';
import 'package:sport_profile_208415/services/services.dart';

class AchievementsProvider extends ChangeNotifier {
  final AchievementsService _achievementsService;

  AchievementsProvider(this._achievementsService);

  int _profileId = -1;

  List<Achievement> _achievements = [];

  List<Achievement> get achievements => _achievements;

  List<Achievement> get openAchievements =>
      _achievements.where((element) => !element.isAchieved).toList();

  List<Achievement> get achievedAchievements =>
      _achievements.where((element) => element.isAchieved).toList();

  int get allAchievementsCount => _achievements.length;

  int get achievedAchievementsCount =>
      _achievements.where((element) => element.isAchieved).length;

  int get allXP {
    int xp = 0;
    for (final achievement in _achievements) {
      xp += achievement.xp;
    }
    return xp;
  }

  void init() async {
    _achievements = await _achievementsService.getAchievements(_profileId);
    notifyListeners();
  }

  void createAchievement(
    String title,
    String description,
    int xp,
    Cup cup,
  ) async {
    final achievement = Achievement(
      id: 0,
      profileId: _profileId,
      title: title,
      description: description,
      xp: xp,
      cup: cup,
    );
    await _achievementsService.createAchievement(achievement);
    _achievements = await _achievementsService.getAchievements(_profileId);
    notifyListeners();
  }

  void completeAchievement(Achievement achievement) async {
    await _achievementsService.updateAchievement(
      achievement.copyWith(isAchieved: true),
    );
    _achievements = await _achievementsService.getAchievements(_profileId);
    notifyListeners();
  }

  void setProfileId(int id) {
    _profileId = id;
    init();
  }
}
