import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/app/domain/entities/pokemon_entity.dart';

void main() {
  test('should return a valid pokemon entity', () {
    expect(
      const PokemonEntity(name: 'Pikachu', urlDetails: ''),
      const PokemonEntity(name: 'Pikachu', urlDetails: ''),
    );
  });
  test('should return a valid pokemon entity hascode', () {
    expect(
      const PokemonEntity(name: 'Pikachu', urlDetails: '').hashCode,
      const PokemonEntity(name: 'Pikachu', urlDetails: '').hashCode,
    );
  });
}
