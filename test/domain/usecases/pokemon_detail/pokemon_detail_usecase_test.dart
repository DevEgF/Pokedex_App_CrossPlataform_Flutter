import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_app/app/domain/entities/pokemon_details_entity.dart';
import 'package:pokedex_app/app/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/domain/repositories/get_pokemon_detail_repository.dart';
import 'package:pokedex_app/app/domain/usecases/pokemon_detail/pokemon_detail_usecase.dart';
import 'package:result_dart/result_dart.dart';

class PokemonEntityMock extends Mock implements PokemonEntity {}

class PokemonDetailsEntityMock extends Mock implements PokemonDetailsEntity {}

class GetPokemonDetailsRepositoryMock extends Mock
    implements GetPokemonDetailsRepository {}

void main() {
  final repository = GetPokemonDetailsRepositoryMock();
  final usecase = PokemonDetailsUsecaseImpl(repository);

  setUpAll(() {
    registerFallbackValue(PokemonEntityMock());
  });

  test('should be a detail pokemon', () async {
    when(() => repository.fetchDetails(pokemonEntity: any(named: 'pokemonEntity'))).thenAnswer((_) async => Success(PokemonDetailsEntityMock()));
  
    final resut = await usecase(pokemonEntity: PokemonEntityMock());

    expect(resut.getOrNull(), isA<PokemonDetailsEntity>());
  });
}
