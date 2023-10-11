// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pokedex_app/app/data/datasource/adapters/pokemon_adapter.dart';
import 'package:pokedex_app/app/data/datasource/remote/pokemon_list/get_pokemon_list_datasource.dart';
import 'package:pokedex_app/app/domain/entities/pokemon_entity.dart';
import 'package:result_dart/result_dart.dart';
import 'package:result_dart/src/result.dart';
import 'package:pokedex_app/app/domain/error/error.dart';
import 'package:pokedex_app/app/domain/repositories/get_pokemon_list_repository.dart';

class GetPokemonListRepositoryImpl implements GetPokemonListRepository {
  final GetPokemonListDatasource datasource;

  GetPokemonListRepositoryImpl(this.datasource);

  @override
  Future<Result<List<PokemonEntity>, FailurePokemon>> fetchPokemons() async {
    try {
      final response = await datasource.getAllPokemons();

      final result = response.map(PokemonAdapter.fromMap).toList();
      return Result.success(result);
    } on FailurePokemon catch (e) {
      return Result.failure(e);
    }
  }
}
