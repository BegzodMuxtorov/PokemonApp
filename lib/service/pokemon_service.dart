//https://pokeapi.co/api/v2/pokemon/ditto

// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:pok_ful/model/pokemon_model.dart';

// class PokemonService {
//   Future<dynamic> getPokemons() async {
//     try {
//       Response response = await Dio().get(
//           "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
//       if (response.statusCode == 200) {
//         PokemonModel.fromJson(jsonDecode(response.data));
//       } else {
//         return response.statusMessage.toString();
//       }
//     } on DioError catch (e) {}
//   }
// }

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pok_ful/core/constants/constants.dart';

import 'package:pok_ful/model/pokemon_model.dart';

class PokemonService {
  Future<dynamic> getPokemon() async {
    try {
      Response response = await Dio().get(MyConstants.pokemonUrl);
      if (response.statusCode == 200) {
        return PokemonModel.fromJson(jsonDecode(response.data));
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}
