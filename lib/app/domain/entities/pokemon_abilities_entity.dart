import 'package:equatable/equatable.dart';

class PokemonAbilityEntity extends Equatable {
  final String name;
  final String url;

  const PokemonAbilityEntity({
    required this.name,
    required this.url,
  });

  @override
  List<Object> get props => [name, url];

  @override
  bool get stringify => true;
}
