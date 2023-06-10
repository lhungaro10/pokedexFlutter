import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/classes/evolution.dart';
import 'package:pokedex/classes/pokemon.dart';
import 'package:pokedex/classes/stat.dart';
import 'package:pokedex/components/evolution_card.dart';
import 'package:pokedex/components/pokemon_info.dart';
import 'package:pokedex/components/pokemon_stat.dart';

class BasicInfo extends StatefulWidget {
  final Pokemon pokemon;
  const BasicInfo({Key? key, required this.pokemon});

  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  final List<Widget> _evolutions = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _evolutions.add(EvolutionCard(evolution: widget.pokemon.evolutionChain));
      _evolutions.addAll(navigateEvolutions(
          widget.pokemon.evolutionChain.pokemonName,
          widget.pokemon.evolutionChain.evolvesTo));
    });
  }

  List<Widget> navigateEvolutions(String from, List<Evolution> evolutionTree) {
    List<Widget> temp = [];
    for (Evolution evo in evolutionTree) {
      temp.add(EvolutionCard(evolution: evo, evolvesFrom: from));
      temp.addAll(navigateEvolutions(evo.pokemonName, evo.evolvesTo));
    }

    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Basic Info",
                style: GoogleFonts.montserrat(
                    color: Colors.black, fontWeight: FontWeight.bold),
              )),
          PokemonInfo(
              infoLabel: "Generation: ", infoValue: widget.pokemon.generation),
          PokemonInfo(
            infoLabel: "Height: ",
            infoValue: "${widget.pokemon.height}m",
          ),
          PokemonInfo(
            infoLabel: "Weight: ",
            infoValue: "${widget.pokemon.weight}kg",
          ),
          PokemonInfo(
              infoLabel: "Abilities: ",
              infoValue: widget.pokemon.abilities.join(", ")),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              height: 2,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Base Stats",
                style: GoogleFonts.montserrat(
                    color: Colors.black, fontWeight: FontWeight.bold),
              )),
          for (PokemonStat stat in widget.pokemon.stats)
            PokemonStatWidget(
              infoLabel: stat.name,
              infoValue: stat.base.toString(),
              statPercent: (stat.base * 100) / 255,
            ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              height: 2,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Family",
                style: GoogleFonts.montserrat(
                    color: Colors.black, fontWeight: FontWeight.bold),
              )),
          GridView.count(
            crossAxisCount: 1,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            childAspectRatio: 21 / 9,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            padding: EdgeInsets.zero,
            children: _evolutions,
          )
        ],
      ),
    );
  }
}
