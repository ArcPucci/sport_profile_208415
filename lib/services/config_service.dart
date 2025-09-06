import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_profile_208415/models/models.dart';

class ConfigService {
  final SharedPreferences _preferences;

  ConfigService(this._preferences);

  static const _profileKey = 'PROFILE';

  Future<void> setProfile(Profile profile) async {
    await _preferences.setInt(_profileKey, profile.id);
  }

  int getProfile() {
    return _preferences.getInt(_profileKey) ?? -1;
  }
}
