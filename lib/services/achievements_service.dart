import 'package:sqflite/sqflite.dart';

import '../models/models.dart';

const achievementsTable = 'achievements_TABLE';

class AchievementsService {
  final Database _database;

  AchievementsService(this._database);

  Future<void> createAchievement(Achievement achievement) async {
    final data = achievement.toMap();
    data['id'] = null;
    await _database.insert(achievementsTable, data);
  }

  Future<void> updateAchievement(Achievement achievement) async {
    final data = achievement.toMap();
    await _database.update(
      achievementsTable,
      data,
      where: 'id = ?',
      whereArgs: [achievement.id],
    );
  }

  Future<List<Achievement>> getAchievements() async {
    final json = await _database.query(achievementsTable);

    if (json.isEmpty) return [];

    return json.map(Achievement.fromMap).toList();
  }
}
