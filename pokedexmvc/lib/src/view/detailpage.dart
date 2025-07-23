import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexmvc/src/model/model.dart';
import 'package:pokedexmvc/src/view/uihelper.dart';
import 'package:pokedexmvc/src/controller/main_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.pokemonIndex}):
  super(key: key);

  final int pokemonIndex;

  @override
  State createState() => _DetailPageState();
}
class _DetailPageState extends StateMVC<DetailPage> {
  @override
    /// Let the 'business logic' run in a Controller
    _DetailPageState(): super(Controller()) {
        con = controller as Controller;
    }
    late Controller con;

    int get _pokemonIndex => widget.pokemonIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //UIHelper.typeColorMap[con.type![0]]
        backgroundColor: UIHelper.typeColorMap[con.getPokemon(_pokemonIndex).type![0]],
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_sharp)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(con.getPokemon(_pokemonIndex).name.toString(), //denendi
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text('# ${con.getPokemon(_pokemonIndex).id.toString()}',  //denendi
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Chip(label: Text(con.getPokemon(_pokemonIndex).type![0])),
            ),
            /*const Align(
                alignment: Alignment.bottomRight,
                child: Image(
                  image: AssetImage('images/pokeball.png'),
                  width: 100,
                )),*/
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    height: 0.15.sh,
                    child: const Image(
                      image: AssetImage('images/pokeball.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0.12.sh,
                    child: Container(
                      color: Colors.white,
                      child: Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22)),
                                  Text(con.getPokemon(_pokemonIndex).name.toString(),  //denendi
                                      style: const TextStyle(fontSize: 22))
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Height',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22)),
                                  Text(con.getPokemon(_pokemonIndex).height.toString(),
                                      style: const TextStyle(fontSize: 22))
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Weight',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22)),
                                  Text(con.getPokemon(_pokemonIndex).weight.toString(),
                                      style: const TextStyle(fontSize: 22))
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Spawn Time',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22)),
                                  Text(con.getPokemon(_pokemonIndex).spawnTime.toString(),
                                      style: const TextStyle(fontSize: 22))
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Weakness',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22)),
                                  Text(con.getPokemon(_pokemonIndex).weaknesses.toString(),
                                      style: const TextStyle(fontSize: 22))
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Pre Evolution',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22)),
                                  Text(con.getPokemon(_pokemonIndex).prevEvolution.toString() ?? con.getPokemon(_pokemonIndex).name.toString(), 
                                      style: const TextStyle(fontSize: 22))
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Next Evolution',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22)),
                                  Text(con.getPokemon(_pokemonIndex).nextEvolution.toString() ?? con.getPokemon(_pokemonIndex).name.toString(), 
                                      style: const TextStyle(fontSize: 22))
                                      
                                ],
                              )
                            ]),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: CachedNetworkImage(
                      height: 0.25.sh,
                      fit: BoxFit.fitHeight,
                      imageUrl: con.getPokemon(_pokemonIndex).img!, 
                      placeholder: (context, url) => CircularProgressIndicator(
                        color: UIHelper.typeColorMap[con.getPokemon(_pokemonIndex).type![0]],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )));
  }
}
