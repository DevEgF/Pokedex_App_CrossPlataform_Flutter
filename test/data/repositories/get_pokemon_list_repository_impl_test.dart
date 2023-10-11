import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_app/app/data/datasource/remote/pokemon_list/get_pokemon_list_datasource.dart';
import 'package:pokedex_app/app/data/repositories/get_pokemon_list_repository_impl.dart';
import 'package:pokedex_app/app/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/domain/error/error.dart';

class GetPokemonListDatasourceMock extends Mock
    implements GetPokemonListDatasource {}

void main() {
  final datasource = GetPokemonListDatasourceMock();
  final repository = GetPokemonListRepositoryImpl(datasource);

  test('should return success', () async {
    when(datasource.getAllPokemons)
        .thenAnswer((_) async => <Map<String, dynamic>>[]);

    final response = await repository.fetchPokemons();

    expect(response.getOrNull(), isA<List<PokemonEntity>>());
  });

  test('should a return Exception', () async {
    when(datasource.getAllPokemons).thenThrow(FailurePokemon(menssage: ''));

    final response = await repository.fetchPokemons();

    expect(response.exceptionOrNull(), isA<FailurePokemon>());
  });
}
