import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/app/domain/entities/pokemon_abilities_entity.dart';
import 'package:pokedex_app/app/domain/entities/pokemon_details_entity.dart';
import 'package:pokedex_app/app/domain/entities/pokemon_types_entity.dart';

void main() {
  test('should return pokemon details entity', () {
    expect(
      const PokemonDetailsEntity(
        name: 'Pikachu',
        type: <PokemomTypeEntity>[],
        abilities: <PokemonAbilityEntity>[],
        urlImage: '',
        weight: 10,
        height: 10,
        stats: [],
      ),
      const PokemonDetailsEntity(
        name: 'Pikachu',
        type: <PokemomTypeEntity>[],
        abilities: <PokemonAbilityEntity>[],
        urlImage: '',
        weight: 10,
        height: 10,
        stats: [],
      ),
    );
  });
  test('should return pokemon details entity hascode', () {
    expect(
      const PokemonDetailsEntity(
        name: 'Pikachu',
        type: <PokemomTypeEntity>[],
        abilities: <PokemonAbilityEntity>[],
        urlImage: '',
        weight: 10,
        height: 10,
        stats: [],
      ).hashCode,
      const PokemonDetailsEntity(
        name: 'Pikachu',
        type: <PokemomTypeEntity>[],
        abilities: <PokemonAbilityEntity>[],
        urlImage: '',
        weight: 10,
        height: 10,
        stats: [],
      ).hashCode,
    );
  });
}
