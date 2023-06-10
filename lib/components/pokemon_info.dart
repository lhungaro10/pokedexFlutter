import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PokemonInfo extends StatelessWidget {
  final String infoLabel;
  final String infoValue;

  const PokemonInfo(
      {Key? key, required this.infoLabel, required this.infoValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 125),
          child: Text(
            infoLabel,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500, color: Colors.grey),
          ),
        ),
        Flexible(
            child: Text(
          infoValue,
          style: GoogleFonts.montserrat(color: Colors.black),
        ))
      ],
    );
  }
}
