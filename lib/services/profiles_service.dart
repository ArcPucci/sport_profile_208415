import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/models.dart';

const profilesTable = 'profiles';

class ProfilesService {
  final Database _database;

  ProfilesService(this._database);

  Future<Profile> createProfile() async {
    final profile = Profile.empty();
    final map = profile.toMap();

    map['id'] = null;
    final id = await _database.insert(profilesTable, map);
    map['id'] = id;
    map['name'] = "Player #$id";
    await _database.update(
      profilesTable,
      map,
      where: 'id = ?',
      whereArgs: [id],
    );

    return profile.copyWith(id: id);
  }

  Future<void> updateProfile(Profile profile) async {
    if (profile.image != null) {
      final dir = await getApplicationDocumentsDirectory();
      final fileName = path.basename(profile.image!);
      final newPath = path.join(dir.path, fileName);

      final file = File(profile.image!);

      await file.copy(newPath);
      profile.image = newPath;
    }

    if (profile.teamLogo != null) {
      final dir = await getApplicationDocumentsDirectory();
      final fileName = path.basename(profile.teamLogo!);
      final newPath = path.join(dir.path, fileName);

      final file = File(profile.teamLogo!);

      await file.copy(newPath);
      profile.teamLogo = newPath;
    }

    await _database.update(
      profilesTable,
      profile.toMap(),
      where: 'id = ?',
      whereArgs: [profile.id],
    );
  }

  Future<Profile> getProfile(int id) async {
    final res = await _database.query(
      profilesTable,
      where: 'id = ?',
      whereArgs: [id],
    );

    return Profile.fromMap(res.first);
  }

  Future<List<Profile>> getProfiles() async {
    final res = await _database.query(profilesTable);
    if (res.isEmpty) return [];
    return res.map((e) => Profile.fromMap(e)).toList();
  }

  Future<void> removeProfile(int id) async {
    await _database.delete(profilesTable, where: 'id = ?', whereArgs: [id]);
  }
}
