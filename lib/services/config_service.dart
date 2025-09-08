import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_profile_208415/models/models.dart';

class ConfigService {
  final SharedPreferences _preferences;

  ConfigService(this._preferences);

  static const _profileKey = 'PROFILE';
  static const _firstInitKey = 'FIRST_INIT';

  Future<void> setProfile(Profile profile) async {
    await _preferences.setInt(_profileKey, profile.id);
  }

  int getProfile() {
    return _preferences.getInt(_profileKey) ?? -1;
  }

  Future<void> setFirstInit() async {
    await _preferences.setBool(_firstInitKey, false);
  }

  bool getFirstInit() {
    return _preferences.getBool(_firstInitKey) ?? true;
  }
}
