import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio_http/config/infrastructure/models/pokemon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Pokemon? pokemon;
  int pokemonId = 0;
  @override
  void initState() {
    super.initState();
    getPokemon();
  }

  Future<void> getPokemon() async {
    pokemonId++;
    final url = 'https://pokeapi.co/api/v2/pokemon/$pokemonId';
    final response = await Dio().get(url);
    pokemon = Pokemon.fromJson(response.data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (pokemon != null) ...[
              Text(pokemon!.id > 0 ? 'Id Pokemon: $pokemonId' : 'Sin datos'),
              Text(pokemon?.name ?? 'Sin datos'),
              _ImagenBubble(
                  imageUrl: pokemon!.sprites.frontDefault.isNotEmpty
                      ? pokemon!.sprites.frontDefault
                      : 'https://media.tenor.com/I2LjGIeovp0AAAAC/problemas-tecnicos.gif'),
              _ImagenBubble(
                  imageUrl: pokemon!.sprites.frontDefault.isNotEmpty
                      ? pokemon!.sprites.backDefault
                      : 'https://media.tenor.com/I2LjGIeovp0AAAAC/problemas-tecnicos.gif'),
            ]
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Btn presionado');
          getPokemon();
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class _ImagenBubble extends StatelessWidget {
  final String imageUrl;
  const _ImagenBubble({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * .7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }

          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      ),
    );
  }
}
