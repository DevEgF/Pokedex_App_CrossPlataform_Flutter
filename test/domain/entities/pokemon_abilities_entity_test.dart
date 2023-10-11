import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/app/domain/entities/pokemon_abilities_entity.dart';

void main() {

  test('should return a pokemon abilities hascode', () {
    expect(
      const PokemonAbilityEntity(name: '', url: '').hashCode,
      const PokemonAbilityEntity (name: '', url: '').hashCode
      );
  });
  test('should return a pokemon abilities', () {
    expect(
      const PokemonAbilityEntity(name: '', url: ''),
      const PokemonAbilityEntity (name: '', url: '')
      );
  });
}