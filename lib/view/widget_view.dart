import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemones/viewmodel/pokemon_viewmodel.dart';

class PokemonSearchPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemon = ref.watch(pokemonViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Busca a tu amigo Pokémon'),
      ),
      backgroundColor: Colors.white, // Cambia el color de fondo según tus preferencias
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Espaciado interior
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) =>
                  ref.read(pokemonViewModelProvider.notifier).fetchPokemon(value),
              decoration: InputDecoration(
                labelText: 'Introduce el nombre del Pokémon',
                hintText: 'Buscar Pokémon', // Puedes agregar un hintText
                prefixIcon: Icon(Icons.search), // Un ícono de búsqueda
                border: OutlineInputBorder( // Bordes redondeados
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 20), // Espacio entre el campo de búsqueda y los resultados
            if (pokemon != null) ...[
              Image.network(
                pokemon.imageUrl,
                height: 150, // Tamaño de la imagen
                width: 150,
                fit: BoxFit.contain, // Ajusta la imagen al tamaño del contenedor
              ),
              SizedBox(height: 10),
              Text(
                'Nombre: ${pokemon.name}',
                style: TextStyle(
                  fontSize: 20, // Tamaño de la fuente
                  fontWeight: FontWeight.bold, // Fuente en negrita
                ),
              ),
              Text(
                'Peso: ${pokemon.weight} kg',
                style: TextStyle(
                  fontSize: 16, // Tamaño de la fuente
                ),
              ),
            ] else ...[
              Text(
                'Pokémon no encontrado',
                style: TextStyle(
                  fontSize: 16, // Tamaño de la fuente
                  color: Colors.red, // Color de texto rojo para resaltar el mensaje de error
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
