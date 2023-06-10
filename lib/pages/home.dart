import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/classes/pokemon.dart';
import 'package:pokedex/components/pokemon_card.dart';
import 'package:pokedex/network.dart';
import 'package:pokedex/pages/details.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  List<Pokemon> _pokeList = [];
  late ScrollController _scrollController;
  int _page = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _loadPokemons();

    _scrollController = ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);
  }

  _scrollListener() {
    if (_scrollController == null) {
      return;
    }

    if (_scrollController != null &&
        _scrollController.offset >=
            _scrollController.position.maxScrollExtent) {
      _loadPokemons();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _loadPokemons() async {
    setState(() {
      _isLoading = true;
    });

    if (_isLoading) {
      List<Pokemon> tempPkn = await Network.getPokemonList(_page);
      tempPkn.forEach((poke) {
        print(poke.name);
      });

      setState(() {
        _pokeList.addAll(tempPkn);
        _page++;
        _isLoading = false;
      });
    }
  }

  _handleOnTap(Pokemon pokemon) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PokemonDetails(pokemon: pokemon)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    Text('Pokedex',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.blueAccent))
                  ],
                ),
              ),
              Image.asset('images/pokeball.png', scale: .75)
            ],
          ),
        ),
        Expanded(
          child: GridView.count(
            controller: _scrollController,
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            mainAxisSpacing: 7.5,
            crossAxisSpacing: 7.5,
            padding: const EdgeInsets.only(left: 7.5, right: 7.5),
            physics: const AlwaysScrollableScrollPhysics(),
            children: _pokeList
                .map((e) => PokemonCard(
                      pokemon: e,
                      onTap: () => _handleOnTap(e),
                    ))
                .toList(),
          ),
        )
      ],
    ));
  }
}
