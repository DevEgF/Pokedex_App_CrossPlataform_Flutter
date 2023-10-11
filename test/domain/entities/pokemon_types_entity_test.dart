import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/app/domain/entities/pokemon_types_entity.dart';

void main() {
  test("should return a valid pokemon types entity", () {
    expect(
      const PokemomTypeEntity(name: 'Pikachu', url: ''),
      const PokemomTypeEntity(name: 'Pikachu', url: ''),
    );
  });
  test("should return a valid pokemon types entity hascode", () {
    expect(
      const PokemomTypeEntity(name: 'Pikachu', url: '').hashCode,
      const PokemomTypeEntity(name: 'Pikachu', url: '').hashCode,
    );
  });
}
