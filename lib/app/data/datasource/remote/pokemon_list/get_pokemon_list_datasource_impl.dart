// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_app/app/data/datasource/remote/pokemon_list/get_pokemon_list_datasource.dart';

import 'package:pokedex_app/app/domain/error/error.dart';
import 'package:pokedex_app/utils/base_url.dart';

@Injectable(as: GetPokemonListDatasource)
class GetPokemonListDatasourceImpl implements GetPokemonListDatasource {
  final Dio dio;

  GetPokemonListDatasourceImpl(this.dio);

  @override
  Future<List<Map<String, dynamic>>> getAllPokemons() async {
    final response = await dio.get(BaseUrl.ALL_POKEMONS);
    if (response.statusCode != 200) {
      throw FailurePokemon(menssage: 'Erro na requisição');
    }
    final result = List<Map<String, dynamic>>.from(response.data['results']);
    return result;
  }
}
