import 'package:pokedex_app/app/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/domain/error/error.dart';
import 'package:pokedex_app/app/domain/repositories/get_pokemon_list_repository.dart';
import 'package:result_dart/result_dart.dart';

abstract class PokemonListUsecase {
  Future<Result<List<PokemonEntity>, FailurePokemon>> call();
}

class PokemonListUsecaseImpl implements PokemonListUsecase {
  final GetPokemonListRepository pokemonRepository;

  PokemonListUsecaseImpl(this.pokemonRepository);

  @override
  Future<Result<List<PokemonEntity>, FailurePokemon>> call() async {
    return pokemonRepository.fetchPokemons().map((success) => success);
  }
}
