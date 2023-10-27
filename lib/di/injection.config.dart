// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pokedex_app/app/data/datasource/remote/pokemon_detail/get_pokemon_detail.dart'
    as _i6;
import 'package:pokedex_app/app/data/datasource/remote/pokemon_detail/get_pomeon_detail_impl.dart'
    as _i7;
import 'package:pokedex_app/app/data/datasource/remote/pokemon_list/get_pokemon_list_datasource.dart'
    as _i10;
import 'package:pokedex_app/app/data/datasource/remote/pokemon_list/get_pokemon_list_datasource_impl.dart'
    as _i11;
import 'package:pokedex_app/app/data/repositories/get_pokemon_detail_repository_impl.dart'
    as _i9;
import 'package:pokedex_app/app/data/repositories/get_pokemon_list_repository_impl.dart'
    as _i13;
import 'package:pokedex_app/app/domain/repositories/get_pokemon_detail_repository.dart'
    as _i8;
import 'package:pokedex_app/app/domain/repositories/get_pokemon_list_repository.dart'
    as _i12;
import 'package:pokedex_app/app/domain/usecases/pokemon_list/pokemon_list_usecase.dart'
    as _i5;
import 'package:pokedex_app/app/presentation/cubit/pokemon_cubit.dart' as _i4;
import 'package:pokedex_app/di/network_module.dart' as _i14;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  gh.factory<_i3.Interceptor>(
    () => networkModule.providePrettyLogger(),
    instanceName: 'PrettyLogger',
  );
  gh.factory<_i4.PokemonCubit>(
      () => _i4.PokemonCubit(gh<_i5.PokemonListUsecase>()));
  gh.factory<String>(
    () => networkModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.singleton<_i3.Dio>(networkModule.provideDio(
    gh<String>(instanceName: 'BaseUrl'),
    gh<_i3.Interceptor>(instanceName: 'PrettyLogger'),
  ));
  gh.factory<_i6.GetPokemonDetailDatasource>(
      () => _i7.GetPokemonDetailDatasourceImpl(gh<_i3.Dio>()));
  gh.factory<_i8.GetPokemonDetailsRepository>(() =>
      _i9.GetPokemonDetailRepositoryImpl(gh<_i6.GetPokemonDetailDatasource>()));
  gh.factory<_i10.GetPokemonListDatasource>(
      () => _i11.GetPokemonListDatasourceImpl(gh<_i3.Dio>()));
  gh.factory<_i12.GetPokemonListRepository>(() =>
      _i13.GetPokemonListRepositoryImpl(gh<_i10.GetPokemonListDatasource>()));
  return getIt;
}

class _$NetworkModule extends _i14.NetworkModule {}
