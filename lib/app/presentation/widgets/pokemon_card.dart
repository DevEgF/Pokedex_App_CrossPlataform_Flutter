import 'package:flutter/material.dart';
import 'package:pokedex_app/app/domain/entities/pokemon_entity.dart';

class PokemonCard extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                pokemon.name.toUpperCase(),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
