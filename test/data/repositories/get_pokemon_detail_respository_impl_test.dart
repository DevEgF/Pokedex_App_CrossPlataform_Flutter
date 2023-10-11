import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_app/app/data/datasource/remote/pokemon_detail/get_pokemon_detail.dart';
import 'package:pokedex_app/app/data/repositories/get_pokemon_detail_repository_impl.dart';
import 'package:pokedex_app/app/domain/entities/pokemon_details_entity.dart';
import 'package:pokedex_app/app/domain/error/error.dart';

import '../../domain/usecases/pokemon_detail/pokemon_detail_usecase_test.dart';

class GetPokemonDetailDatasourceMock extends Mock
    implements GetPokemonDetailDatasource {}

void main() {
  final datasource = GetPokemonDetailDatasourceMock();
  final repository = GetPokemonDetailRepositoryImpl(datasource);
  final Map<String, dynamic> pokemonDetailsMap = {
    'name': 'Pikachu',
    'types': [
      {
        'type': {'name': 'electric'}
      },
      {
        'type': {'name': 'normal'}
      },
    ],
    'abilities': [
      {
        'ability': {'name': 'static'}
      },
      {
        'ability': {'name': 'lightning-rod'}
      },
    ],
    'sprites': {
      'front_default':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png'
    },
  };

  setUpAll(() {
    registerFallbackValue(PokemonEntityMock());
  });

  test('should return a pokemon details', () async {
    when(() =>
            datasource.getDetails(pokemonEntity: PokemonEntityMock()))
        .thenAnswer((_) async => pokemonDetailsMap);

    final result =
        await repository.fetchDetails(pokemonEntity: PokemonEntityMock());

    expect(result.getOrNull(), isA<PokemonDetailsEntity>());
  });

  test('pokemon details exception', () async {
    when(
      () => datasource.getDetails(pokemonEntity: any(named: 'pokemonEntity')),
    ).thenThrow(FailurePokemon(menssage: ''));

    final result =
        await repository.fetchDetails(pokemonEntity: PokemonEntityMock());

    expect(result.exceptionOrNull(), isA<FailurePokemon>());
  });
}
