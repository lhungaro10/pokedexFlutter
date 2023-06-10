import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/classes/pokemon.dart';

class PokemonStatWidget extends StatelessWidget {
  final String infoLabel;
  final String infoValue;
  final double statPercent;

  const PokemonStatWidget(
      {Key? key,
      required this.infoLabel,
      required this.infoValue,
      required this.statPercent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 150),
            child: Text(
              infoLabel,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500, color: Colors.grey),
            )),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 40),
          child: Text(
            infoValue,
            style: GoogleFonts.montserrat(color: Colors.black),
          ),
        ),
        Flexible(
            child: LinearProgressIndicator(
          value: statPercent / 100.0,
          minHeight: 10,
        ))
      ],
    );
  }
}
