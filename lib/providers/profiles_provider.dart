import 'package:flutter/material.dart';
import 'package:sport_profile_208415/models/models.dart';
import 'package:sport_profile_208415/services/services.dart';

class ProfilesProvider extends ChangeNotifier {
  final ProfilesService _profilesService;
  final ConfigService _configService;

  ProfilesProvider(this._profilesService, this._configService) {
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
  }

  Future<void> updateProfile(Profile profile) async {
    await _profilesService.updateProfile(profile);
    notifyListeners();
  }
}
