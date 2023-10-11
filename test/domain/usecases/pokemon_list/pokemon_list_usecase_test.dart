import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_app/app/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/domain/repositories/get_pokemon_list_repository.dart';
import 'package:pokedex_app/app/domain/usecases/pokemon_list/pokemon_list_usecase.dart';
import 'package:result_dart/result_dart.dart';

class GetPokemonListRepositoryMock extends Mock
    implements GetPokemonListRepository {}

void main() {
  final repository = GetPokemonListRepositoryMock();
  final usecase = PokemonListUsecaseImpl(repository);

  setUpAll(() {
    registerFallbackValue(GetPokemonListRepositoryMock());
  });

  test('should be a validate list of pokemon', () async {
    when(repository.fetchPokemons).thenAnswer(
      (_) async => const Success(<PokemonEntity>[]),
    );

    final result = await usecase();

    expect(result.getOrNull(), isA<List<PokemonEntity>>());
  });
}
