import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:poke_api/pokemon.dart';

class API {
  Future <Pokemon> fetchPokemon() async{
    final response = await http.get(Uri.https('pokeapi.co', '/api/v2/pokemon/1'));

    if(response.statusCode == 200) {
      final pokemon = Pokemon.fromJson(jsonDecode(response.body));
      print(pokemon.nome);
    } else {

    }
  }
}