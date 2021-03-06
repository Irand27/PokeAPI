import 'package:flutter/material.dart';
import 'package:poke_api/poke_controller.dart';
import 'pokemon.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final controller = PokeController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        FutureBuilder<Pokemon>(
          future: controller.pokemon,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return CircularProgressIndicator();
            }
            print(snapshot.hasData);
            if (snapshot.hasData) {
              return Column(
                children: [
                  Image.network(
                    snapshot.data.urlImage,
                    height: 400,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    snapshot.data.nome,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(
                snapshot.error,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              );
            }
            return Container();
          },
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                controller.loadPokemon();
              });
            },
            child: Text('Load Pokemon'))
      ]),
    );
  }
}
