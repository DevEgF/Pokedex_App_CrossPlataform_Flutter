import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/app/data/datasource/remote/pokemon_list/get_pokemon_list_datasource_impl.dart';
import 'package:pokedex_app/app/data/repositories/get_pokemon_list_repository_impl.dart';
import 'package:pokedex_app/app/domain/usecases/pokemon_list/pokemon_list_usecase.dart';
import 'package:pokedex_app/app/presentation/cubit/pokemon_cubit.dart';
import 'package:pokedex_app/app/presentation/widgets/pokemon_card.dart';
import 'package:pokedex_app/utils/app_colors.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({super.key});

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  late PokemonCubit pokemonCubit; // Crie uma instância do seu Cubit

  @override
  void initState() {
    super.initState();
    pokemonCubit = PokemonCubit(PokemonListUsecaseImpl(
        GetPokemonListRepositoryImpl(GetPokemonListDatasourceImpl(Dio()))));
    pokemonCubit.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: const Text('Pokedex'),
      ),
      body: BlocBuilder<PokemonCubit, PokemonState>(
        bloc: pokemonCubit,
        builder: (context, state) {
          if (state is PokemonLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonLoadedState) {
            final pokemonList = state.pokemonList;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: pokemonList.length,
              itemBuilder: (context, index) {
                final pokemon = pokemonList[index];
                return PokemonCard(pokemon: pokemon);
              },
            );
          } else if (state is PokemonErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
