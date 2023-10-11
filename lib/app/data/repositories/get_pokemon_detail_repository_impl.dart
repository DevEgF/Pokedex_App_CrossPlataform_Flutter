// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pokedex_app/app/data/datasource/adapters/pokemon_details_adapter.dart';
import 'package:result_dart/src/result.dart';

import 'package:pokedex_app/app/data/datasource/remote/pokemon_detail/get_pokemon_detail.dart';
import 'package:pokedex_app/app/domain/entities/pokemon_details_entity.dart';
import 'package:pokedex_app/app/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/domain/error/error.dart';
import 'package:pokedex_app/app/domain/repositories/get_pokemon_detail_repository.dart';

class GetPokemonDetailRepositoryImpl implements GetPokemonDetailsRepository {
  final GetPokemonDetailDatasource pokemonDetailDatasource;

  GetPokemonDetailRepositoryImpl(
    this.pokemonDetailDatasource,
  );

  @override
  Future<Result<PokemonDetailsEntity, FailurePokemon>> fetchDetails(
      {required PokemonEntity pokemonEntity}) async {
    try {
      final response = await pokemonDetailDatasource.getDetails(
          pokemonEntity: pokemonEntity);
      final result = PokemonDetailsAdapter.fromMap(response);
      return Result.success(result);
    } on FailurePokemon catch (e) {
      return Result.failure(e);
    }
  }
}
