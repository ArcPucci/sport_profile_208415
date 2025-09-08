import 'package:sqflite/sqflite.dart';

import '../models/models.dart';

const String matchesTable = 'matches_TABLE';

class MatchesService {
  final Database _database;

  MatchesService(this._database);

  Future<void> createMatch(MatchModel match) async {
    final map = match.toMap();
    map['id'] = null;

    await _database.insert(matchesTable, map);
  }

  Future<void> updateMatch(MatchModel match) async {
    final map = match.toMap();
    await _database.update(
      matchesTable,
      map,
      where: 'id = ?',
      whereArgs: [match.id],
    );
  }

  Future<void> deleteMatch(int id) async {
    await _database.delete(
      matchesTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<MatchModel>> getMatches(int profileId) async {
    final maps = await _database.query(
      matchesTable,
      where: 'profile_id = ?',
      whereArgs: [profileId],
    );

    if (maps.isEmpty) return [];
    return maps.map(MatchModel.fromMap).toList();
  }

  Future<void> deleteMatchesByProfileId(int profileId) async {
    await _database.delete(
      matchesTable,
      where: 'profile_id = ?',
      whereArgs: [profileId],
    );
  }
}
