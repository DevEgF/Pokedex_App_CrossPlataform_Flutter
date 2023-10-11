import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_app/app/data/datasource/remote/pokemon_list/get_pokemon_list_datasource_impl.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = GetPokemonListDatasourceImpl(dio);

  test('should return a success', () async {
    when(
      () => dio.get(any()),
    ).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: {'results': []},
      ),
    );

    final future = await datasource.getAllPokemons();
    expect(future, isA<List<Map<String, dynamic>>>());
  });

   test('pokemon datasource Exception', () {
    when(
      () => dio.get(any()),
    ).thenThrow(Exception());

    final future = datasource.getAllPokemons();

    expect(future, throwsA(isA<Exception>()));
  });

  test('pokemon datasource RequestError', () async {
    when(
      () => dio.get(any()),
    ).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 401,
        data: <Map<String, dynamic>>[],
      ),
    );

    final future = datasource.getAllPokemons();
    
    expect(future, throwsA(isA<Exception>()));
  });
}
