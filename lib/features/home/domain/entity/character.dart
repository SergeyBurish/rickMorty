class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String image;
  final String? type;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.image,
    this.type,
  });
}