import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../service/pokemon_service.dart';
import '../model/pokemon_model.dart';

// Define el Provider para tu servicio PokemonService
final pokemonServiceProvider = Provider<PokemonService>((ref) {
  return PokemonService();
});

// Define el StateNotifierProvider para tu ViewModel
final pokemonViewModelProvider = StateNotifierProvider<PokemonViewModel, Pokemon?>((ref) {
  // Aquí, pasas directamente el ref a tu ViewModel
  return PokemonViewModel(ref);
});

class PokemonViewModel extends StateNotifier<Pokemon?> {
  // Usa Ref para acceder a otros providers dentro de StateNotifier
  final Ref ref;

  PokemonViewModel(this.ref) : super(null);

  Future<void> fetchPokemon(String name) async {
    // Aquí es correcto y 'ref' está definido porque se pasa al constructor de la clase
    final pokemonService = ref.read(pokemonServiceProvider);
    try {
      final response = await pokemonService.fetchPokemon(name);
      if (response.statusCode == 200) {
        state = Pokemon.fromJson(response.data);
      } else {
        state = null; // Manejar el error o un estado de "no encontrado"
      }
    } catch (e) {
      state = null; // En caso de error en la petición, también manejas el estado adecuadamente
    }
  }
}
