import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/classes/pokemon.dart';
import 'package:pokedex/components/type_card.dart';
import 'package:pokedex/utils.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final Function()? onTap;
  const PokemonCard({Key? key, required this.pokemon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: pokemon.types.first.colors.primary,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("#${pokemon.pokedexId}",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white)),
              Text(
                capitalizeWords(pokemon.name, "-", replace: " "),
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                        pokemon.types.map((e) => TypeCard(type: e)).toList(),
                  ),
                  Image.network(
                    pokemon.image,
                    width: 94,
                    height: 94,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
