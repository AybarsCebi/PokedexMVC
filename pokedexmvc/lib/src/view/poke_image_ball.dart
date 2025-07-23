import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedexmvc/src/model/model.dart';
import 'package:pokedexmvc/src/view/uihelper.dart';
import 'detailpage.dart';

class PokeImageBall extends StatelessWidget {
  final PokemonModel pokemon;
  final int pokemonIndex;
  const PokeImageBall({super.key, required this.pokemon, required this.pokemonIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Align(
            alignment: Alignment.bottomRight,
            child: Image(
              image: AssetImage('images/pokeball.png'),
              fit: BoxFit.fitHeight,
            )),
        Align(
          alignment: Alignment.bottomRight,
          child: CachedNetworkImage(
            imageUrl: pokemon.img!,
            placeholder: (context, url) => CircularProgressIndicator(
              color: UIHelper.typeColorMap[pokemon.type![0]],
            ),
          ),
        ),
        IconButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(pokemonIndex: pokemonIndex)),
            );
          }, icon: const Icon(Icons.add_circle))
      ],
    );
  }
}
