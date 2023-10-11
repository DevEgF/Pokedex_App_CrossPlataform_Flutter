import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex_app/app/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/domain/usecases/pokemon_list/pokemon_list_usecase.dart';
part 'state/pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final PokemonListUsecase pokemonUsecase;
  

  PokemonCubit(this.pokemonUsecase) : super(PokemonInitialState());

  Future<void> getPokemons() async {
    emit(PokemonLoadingState());

    try {
      final result = await pokemonUsecase.call();
      final pokemonList = result.getOrThrow();

      emit(PokemonLoadedState(pokemonList));
    } catch (_) {
      emit(PokemonErrorState('Error to load pokemon list'));
    }
  }
}
