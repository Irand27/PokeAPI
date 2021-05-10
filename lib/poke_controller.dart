import 'package:poke_api/poke_model.dart';

class PokeController {

  final model = PokeModel();
  loadPokemon(){
    model.fetchPokemon();
  }
}