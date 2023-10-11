// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:pokedex_app/app/data/datasource/remote/pokemon_detail/get_pokemon_detail.dart';
import 'package:pokedex_app/app/domain/entities/pokemon_entity.dart';

class GetPokemonDetailDatasourceImpl implements GetPokemonDetailDatasource {
  final Dio dio;
  GetPokemonDetailDatasourceImpl(this.dio);

  @override
  Future<Map<String, dynamic>> getDetails(
      {required PokemonEntity pokemonEntity}) async {
    final response = await dio.get(pokemonEntity.urlDetails);
    if (response.statusCode != 200) {
      throw Exception('No details to show');
    } else {
      return response.data;
    }
  }
}
