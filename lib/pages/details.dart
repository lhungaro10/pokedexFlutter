import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/classes/pokemon.dart';
import 'package:pokedex/components/basic_info.dart';
import 'package:pokedex/components/pokemon_info.dart';
import 'package:pokedex/utils.dart';

class PokemonDetails extends StatefulWidget {
  final Pokemon pokemon;
  const PokemonDetails({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "${capitalizeWords(widget.pokemon.name, "-", replace: " ")} #${widget.pokemon.pokedexId}",
          style: GoogleFonts.montserrat(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: widget.pokemon.types.first.colors.primary),
              constraints: BoxConstraints(
                  minHeight: 500, minWidth: MediaQuery.of(context).size.width),
              child: Stack(
                children: [
                  Positioned(
                    bottom: -35,
                    left: 0,
                    child: Image.asset(
                      "images/pokeball_2.png",
                      scale: .75,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 5),
                    child: Image.network(
                        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${widget.pokemon.pokedexId}.png"),
                  )
                ],
              ),
            ),
            BasicInfo(pokemon: widget.pokemon)
          ],
        ),
      ),
    );
  }
}
