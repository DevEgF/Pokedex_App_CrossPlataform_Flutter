import 'package:pokedex_app/app/domain/entities/pokemon_stats_entity.dart';

class PokemonStatsAdapter {
  static PokemonStatsEntity fromMap(dynamic data) {
    return PokemonStatsEntity(
      name: data['stat']['name'],
      value: data['base_stat'],
    );
  }
}
