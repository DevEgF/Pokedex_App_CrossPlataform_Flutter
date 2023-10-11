import 'package:pokedex_app/app/domain/entities/pokemon_details_entity.dart';
import 'package:pokedex_app/app/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/domain/error/error.dart';
import 'package:result_dart/result_dart.dart';

abstract class GetPokemonDetailsRepository {
  Future<Result<PokemonDetailsEntity, FailurePokemon>> fetchDetails({
    required PokemonEntity pokemonEntity,
  });
}