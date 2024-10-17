import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokeapi/service/pokeapi_service.dart';

class Pokedex extends StatefulWidget {
  const Pokedex({super.key});

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  final PokeApiService _pokeApiService = PokeApiService();
  List<dynamic> _pokemonList = [];
  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    _loadPokemonList();
  }

  Future<void> _loadPokemonList() async {
    try {
      final data = await _pokeApiService.buscaListaPokemon(20, 0);
      setState(() {
        _pokemonList = data['results'];
        _isloading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: _isloading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _pokemonList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_pokemonList[index]['name']),
                );
              },
            ),
    );
  }
}
