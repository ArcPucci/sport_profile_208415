import 'package:sport_profile_208415/models/models.dart';
import 'package:sport_profile_208415/utils/utils.dart';

final List<MatchType> matchTypes = [
  MatchType(
    id: 0,
    name: 'Official Match',
    smallRect: 'assets/png/blue_rect.png',
    bigRect: 'assets/png/official.png',
    color: AppTheme.blue2,
  ),
  MatchType(
    id: 1,
    name: 'Training',
    smallRect: 'assets/png/pink_rect.png',
    bigRect: 'assets/png/training.png',
    color: AppTheme.pink2,
  ),
  MatchType(
    id: 2,
    name: 'Friendly Match',
    smallRect: 'assets/png/green_rect.png',
    bigRect: 'assets/png/friendly.png',
    color: AppTheme.green3,
  ),
];
