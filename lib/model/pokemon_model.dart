class Pokemon {
  final String name;
  final int weight;
  final String imageUrl;

  Pokemon({required this.name, required this.weight, required this.imageUrl});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      weight: json['weight'],
      imageUrl: json['sprites']['front_default'],
    );
  }
}
