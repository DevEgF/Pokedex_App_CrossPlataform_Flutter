import 'package:pokedex_app/app/domain/entities/pokemon_entity.dart';

abstract class GetPokemonDetailDatasource {
  Future<Map<String, dynamic>> getDetails({
    required PokemonEntity pokemonEntity,
  });
}