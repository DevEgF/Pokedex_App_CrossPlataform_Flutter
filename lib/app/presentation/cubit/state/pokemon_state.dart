part of '../pokemon_cubit.dart';

abstract class PokemonState extends Equatable {}

class PokemonInitialState extends PokemonState {
  @override
  List<Object?> get props => [];
}

class PokemonLoadingState extends PokemonState {
  @override
  List<Object?> get props => [];
}

class PokemonLoadedState extends PokemonState {
  final List<PokemonEntity> pokemonList;

  PokemonLoadedState(this.pokemonList);

  @override
  List<Object?> get props => [pokemonList];
}

class PokemonErrorState extends PokemonState {
  final String error;

  PokemonErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
