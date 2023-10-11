import 'package:pokedex_app/app/domain/entities/pokemon_details_entity.dart';
import 'package:pokedex_app/app/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/domain/error/error.dart';
import 'package:pokedex_app/app/domain/repositories/get_pokemon_detail_repository.dart';
import 'package:result_dart/result_dart.dart';

abstract class PokemonDetailUseCase {
  Future<Result<PokemonDetailsEntity, FailurePokemon>> call({
    required PokemonEntity pokemonEntity,
  });
}

class PokemonDetailsUsecaseImpl implements PokemonDetailUseCase {
  final GetPokemonDetailsRepository pokemonDetailsRepository;

  PokemonDetailsUsecaseImpl(this.pokemonDetailsRepository);
  @override
  Future<Result<PokemonDetailsEntity, FailurePokemon>> call({
    required PokemonEntity pokemonEntity,
  }) {
    return pokemonDetailsRepository.fetchDetails(pokemonEntity: pokemonEntity);
  }
}
