import 'package:pokedex/classes/evolution.dart';
import 'package:pokedex/classes/multiplier.dart';
import 'package:pokedex/classes/stat.dart';
import 'package:pokedex/classes/type.dart';

class Pokemon {
  List<PokemonType> types;
  int pokedexId;
  String name;
  String image;
  double weight;
  double height;
  List<String> abilities;
  List<PokemonStat> stats;
  Map<MultiplierType, PokemonMultiplier> multipliers;
  String generation;
  Evolution evolutionChain;

  Pokemon(
    this.pokedexId, 
    this.name, 
    this.types, 
    this.image, 
    this.abilities,
    this.height, 
    this.weight,
    this.stats,
    this.multipliers,
    this.generation,
    this.evolutionChain
  );
}
