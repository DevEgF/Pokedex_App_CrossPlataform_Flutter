import 'package:pokedex_app/app/domain/entities/pokemon_details_entity.dart';
import 'pokemon_ability_adapter.dart';
import 'pokemon_stats_adapter.dart';
import 'pokemon_type_adapter.dart';

class PokemonDetailsAdapter {
  static PokemonDetailsEntity fromMap(Map<String, dynamic> data) {
    return PokemonDetailsEntity(
      name: data['name'],
      type: (data['types'] as List).map(PokemonTypeAdapter.fromMap).toList(),
      abilities: (data['abilities'] as List)
          .map(PokemonAbilityAdapter.fromMap)
          .toList(),
      urlImage: data['sprites']['front_default'],
      height: data['height'] / 10.0,
      weight: data['weight'] / 10.0,
      stats: (data['stats'] as List).map(PokemonStatsAdapter.fromMap).toList(),
    );
  }
}
