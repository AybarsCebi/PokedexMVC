import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:pokedexmvc/src/model/model.dart';

class Controller extends ControllerMVC{
  factory Controller([StateMVC? state]) => _this ??= Controller._(state);
  Controller._(StateMVC? state)
      : _pokemonListModel = PokemonListModel(),
        super(state);
  static Controller? _this;

  final PokemonListModel _pokemonListModel;

  PokemonModel getPokemon(int index) {
    return _pokemonListModel.pokemons[index];
  }
}