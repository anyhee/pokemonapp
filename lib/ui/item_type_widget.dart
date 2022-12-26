import 'package:flutter/material.dart';
import 'package:pokemonapp/models/pokemon_model.dart/';
import 'package:pokemonapp/pages/detail_page.dart';
import 'package:pokemonapp/ui/general/colors.dart';
import 'package:pokemonapp/ui/widgets/item_type_widget.dart';
class ItemPokemonWidget extends StatelessWidget {
  // String name;
  // String image;
  // List<String>types;

  PokemonModel pokemon;

  ItemPokemonWidget({
    // required this.name,
    // required this.image,
    // required this.types,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(pokemon: pokemon,)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorsPokemon[pokemon.type.first],
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -20,
              right: -20,
              child: Image.asset('assets/images/poke.png',
                height: 120.0,
                color: Colors.white.withOpacity(0.27),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0, horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Column(
                  //   children: types.map((e) => ItemTypeWidget()).toList(),
                  // ),

                  ...pokemon.type.map((e) => ItemTypeWidget(text: e,)).toList(),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.network(pokemon.img),
            ),
          ],
        ),
      ),
    );
  }
}
************************************item_type.dart*************************
import 'package:flutter/material.dart';
class ItemTypeWidget extends StatelessWidget {

  String text;
  ItemTypeWidget({required this.text,});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.only(bottom: 4, right: 12.0, top: 4.0),
      padding: const EdgeInsets.symmetric(
          horizontal: 14.0, vertical: 0.4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.27),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.07),
              offset: const Offset(4, 4),
              blurRadius: 12.0
          )
        ],
      ),
      child: Text(
        "Grass",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}