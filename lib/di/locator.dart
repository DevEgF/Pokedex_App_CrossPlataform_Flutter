import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_app/app/data/datasource/remote/pokemon_detail/get_pokemon_detail.dart';
import 'package:pokedex_app/app/data/datasource/remote/pokemon_detail/get_pomeon_detail_impl.dart';
import 'package:pokedex_app/app/data/datasource/remote/pokemon_list/get_pokemon_list_datasource.dart';
import 'package:pokedex_app/app/data/datasource/remote/pokemon_list/get_pokemon_list_datasource_impl.dart';
import 'package:pokedex_app/app/data/repositories/get_pokemon_detail_repository_impl.dart';
import 'package:pokedex_app/app/data/repositories/get_pokemon_list_repository_impl.dart';
import 'package:pokedex_app/app/domain/repositories/get_pokemon_detail_repository.dart';
import 'package:pokedex_app/app/domain/repositories/get_pokemon_list_repository.dart';
import 'package:pokedex_app/app/domain/usecases/pokemon_detail/pokemon_detail_usecase.dart';
import 'package:pokedex_app/app/domain/usecases/pokemon_list/pokemon_list_usecase.dart';
import 'package:pokedex_app/app/presentation/cubit/pokemon_cubit.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<Dio>(() {
    final dio = Dio();
    return dio;
  });

  locator.registerLazySingleton<GetPokemonListDatasource>(
      () => GetPokemonListDatasourceImpl(locator<Dio>()));

  locator.registerLazySingleton<GetPokemonListRepository>(
      () => GetPokemonListRepositoryImpl(locator<GetPokemonListDatasource>()));

  locator.registerLazySingleton<PokemonListUsecase>(
      () => PokemonListUsecaseImpl(locator<GetPokemonListRepository>()));

  locator.registerFactory<PokemonCubit>(
      () => PokemonCubit(locator<PokemonListUsecase>()));

  locator.registerLazySingleton<GetPokemonDetailDatasource>(
      () => GetPokemonDetailDatasourceImpl(locator<Dio>()));

  locator.registerLazySingleton<GetPokemonDetailsRepository>(() =>
      GetPokemonDetailRepositoryImpl(locator<GetPokemonDetailDatasource>()));

  locator.registerLazySingleton<PokemonDetailUseCase>(
      () => PokemonDetailsUsecaseImpl(locator<GetPokemonDetailsRepository>()));
}
