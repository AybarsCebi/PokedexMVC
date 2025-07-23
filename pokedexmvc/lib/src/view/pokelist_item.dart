import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexmvc/src/view/poke_image_ball.dart';
import 'package:pokedexmvc/src/model/model.dart';
import 'uihelper.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  final int pokemonIndex;
  const PokeListItem({super.key, required this.pokemon, required this.pokemonIndex});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
      elevation: 3,
      shadowColor: Colors.white,
      color: UIHelper.typeColorMap[pokemon.type![0]],
      child: Column(children: [
        Align(
            alignment: Alignment.topLeft,
            child: Text(pokemon.name ?? 'N/A', 
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold))),
        Align(
            alignment: Alignment.topLeft,
            child: Chip(
                label: Text(
              pokemon.type![0],
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ))),
        Expanded(child: PokeImageBall(pokemon: pokemon, pokemonIndex: pokemonIndex,))
      ]),
    );
  }
}



