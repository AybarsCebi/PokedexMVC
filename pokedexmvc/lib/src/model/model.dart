import 'dart:convert';

import 'package:mvc_pattern/mvc_pattern.dart';

PokemonModel pokemonModelFromJson(String str) => PokemonModel.fromJson(json.decode(str));

String pokemonModelToJson(PokemonModel data) => json.encode(data.toJson());

class PokemonListModel extends ModelMVC {
  factory PokemonListModel([StateMVC? state]) => _this ??= PokemonListModel._(state);
  PokemonListModel._(StateMVC? state) : super(state);
  static PokemonListModel? _this;

  late List<PokemonModel> pokemons;
}

// TODO: @aybars => change its name to PokemonDataClass
class PokemonModel {
  //factory PokemonModel([StateMVC? state]) => _this ??= PokemonModel._(state);
  //PokemonModel._(StateMVC? state) : super(state);
  //static PokemonModel? _this;

    PokemonModel({
        this.id,
        this.num,
        this.name,
        this.img,
        this.type,
        this.height,
        this.weight,
        this.candy,
        this.candyCount,
        this.egg,
        this.spawnChance,
        this.avgSpawns,
        this.spawnTime,
        this.multipliers,
        this.weaknesses,
        this.prevEvolution,
        this.nextEvolution,
    });

    
    int? id;
    int? get M_id=>id;
    String? num;
    String? get M_num=>num;
    String? name;
    String? get M_name=>name;
    String? img;
    String? get M_img=>img;



    List<String>? type;
    List<String>? get M_type=>type;
    String? height;
    String? get M_height=>height;
    String? weight;
    String? get M_weight=>weight;
    String? candy;
    String? get M_candy=>candy;
    int? candyCount;
    int? get M_candyCount=>candyCount;
    String? egg;
    String? get M_egg=>egg;
    double? spawnChance;
    double? get M_spawnChance=>spawnChance;
    double? avgSpawns;
    double? get M_avgSpawns=>avgSpawns;
    String? spawnTime;
    String? get M_spawnTime=>spawnTime;
    List<double>? multipliers;
    List<double>? get M_multipliers=>multipliers;
    List<String>? weaknesses;
    List<String>? get M_weaknesses=>weaknesses;
    List<Evolution>? prevEvolution;
    List<Evolution>? get M_prevEvolution=>prevEvolution;
    List<Evolution>? nextEvolution;
    List<Evolution>? get M_nextEvolution=>nextEvolution;

    @override
    String toString() {
      return name!;
    }

    factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        img: json["img"],
        type: json["type"] ==null ? null : List<String>.from(json["type"].map((x) => x)),
        height: json["height"],
        weight: json["weight"],
        candy: json["candy"],
        candyCount: json["candy_count"],
        egg: json["egg"],
        spawnChance: json["spawn_chance"]?.toDouble(),
        avgSpawns: json["avg_spawns"]?.toDouble(),
        spawnTime: json["spawn_time"],
        multipliers: json["multipliers"] == null ? null : List<double>.from(json["multipliers"].map((x) => x.toDouble())),
        weaknesses: json["weaknesses"] == null ? null : List<String>.from(json["weaknesses"].map((x) => x)),
        prevEvolution: json["prev_evolution"] == null ? null : List<Evolution>.from(json["prev_evolution"].map((x) => Evolution.fromJson(x))),
        nextEvolution: json["next_evolution"] == null ? null : List<Evolution>.from(json["next_evolution"].map((x) => Evolution.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "num": num,
        "name": name,
        "img": img,
        "type": type == null ? null : List<dynamic>.from(type!.map((x) => x)),
        "height": height,
        "weight": weight,
        "candy": candy,
        "candy_count": candyCount,
        "egg": egg,
        "spawn_chance": spawnChance,
        "avg_spawns": avgSpawns,
        "spawn_time": spawnTime,
        "multipliers": multipliers == null ? null : List<dynamic>.from(multipliers!.map((x) => x)),
        "weaknesses": weaknesses == null ? null : List<dynamic>.from(weaknesses!.map((x) => x)),
        "prev_evolution": prevEvolution == null ? null : List<dynamic>.from(prevEvolution!.map((x) => x.toJson())),
        "next_evolution": nextEvolution == null ? null : List<dynamic>.from(nextEvolution!.map((x) => x.toJson())),
    };

  String MVCtry(){
    return "OKEY";
  }
}

class Evolution {
    Evolution({
        this.num,
        this.name,
    });

    String? num;
    String? name;

    factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
        num: json["num"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "num": num,
        "name": name,
    };

    @override
  String toString() {
    return '$name';
  }
}

