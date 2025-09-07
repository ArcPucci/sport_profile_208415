import 'package:flutter/material.dart';
import 'package:sport_profile_208415/models/models.dart';
import 'package:sport_profile_208415/providers/providers.dart';
import 'package:sport_profile_208415/services/services.dart';

class ProfilesProvider extends ChangeNotifier {
  final AchievementsProvider _achievementsProvider;
  final ProfilesService _profilesService;
  final ConfigService _configService;

  ProfilesProvider(
    this._achievementsProvider,
    this._profilesService,
    this._configService,
  ) {
    init();
  }

  List<Profile> _profiles = [];

  List<Profile> get profiles => _profiles;

  Profile _profile = Profile.empty();

  Profile get profile => _profile;

  void init() async {
    _profiles = await _profilesService.getProfiles();
    final id = _configService.getProfile();

    if (id == -1) _profile = _profiles.first;
    if (id != -1) _profile = await _profilesService.getProfile(id);

    _achievementsProvider.setProfileId(_profile.id);
  }

  Future<void> updateProfile(Profile profile) async {
    await _profilesService.updateProfile(profile);
    notifyListeners();
  }

  void updateStats(List<int> stats) async {
    _profile.stats = stats;
    await _profilesService.updateProfile(_profile);
    notifyListeners();
  }
}
