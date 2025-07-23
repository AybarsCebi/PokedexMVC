import 'package:pokedexmvc/src/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexmvc/src/view/apptile.dart';
import 'package:pokedexmvc/src/view/pokedex_api.dart';
import 'package:pokedexmvc/src/view/pokelist_item.dart';
import 'package:pokedexmvc/src/model/model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> {

  _HomePageState(): super(Controller()) {
        con = controller as Controller;
    }
    late Controller con;

  late Future<List<PokemonModel>> _pokemonListFuture;
  @override
  void initState() {
    super.initState();

    _pokemonListFuture = PokeApi.getPokemonData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder:(context, orientation) => Column(
        children: [
          AppTile(),
          Expanded(
            child: FutureBuilder<List<PokemonModel>>(
                future: _pokemonListFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<PokemonModel> listItems = snapshot.data!;
                    debugPrint(listItems.toString());
                    debugPrint(listItems.length.toString());
                    
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: ScreenUtil().orientation==Orientation.portrait ? 2:3),
                        itemBuilder: (context, index) {
                          var currentPokemon = listItems[index];
                          return PokeListItem(pokemon: currentPokemon, pokemonIndex: index,);
                        });
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Hata var'));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )
        ],),
      ),
    );
  }
}