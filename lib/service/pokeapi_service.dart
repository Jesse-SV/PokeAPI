import 'dart:convert';
import 'package:http/http.dart' as http;

class PokeApiService{
  final String _base = "https://pokeapi.co/api/v2";

  Future<Map<String, dynamic>> buscaPokemon(String nome) async{
    final response = await http.get(Uri.parse("$_base/pokemon/$nome"));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Falha ao carregar o Pokemon");
    }
  }

  Future<Map<String, dynamic>> buscaListaPokemon(int limite, int offset) async{
    final response = await http.get(Uri.parse("$_base/pokemon?limit=$limite&offset=$offset"));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Falha ao carregar a lista de Pokemons");
    }
  }
}