import 'package:poke_api/pokemon.dart';

import 'API.dart';

class PokeModel {
  Future<Pokemon> _pokemon;

  Future<Pokemon> get pokemon => _pokemon;
  fetchPokemon(int number){
    _pokemon = API().fetchPokemon(number);
  }
}