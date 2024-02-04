import 'package:dio/dio.dart';

class PokemonService {
  final Dio _dio = Dio(); // Asegúrate de importar Dio

  Future<Response> fetchPokemon(String name) async {
    try {
      final response = await _dio.get('https://pokeapi.co/api/v2/pokemon/$name');
      return response;
    } catch (e) {
      throw Exception('Failed to load pokemon');
    }
  }
}

