class CharacterModel {
  final int id;
  final String image;
  final String name;

  CharacterModel({required this.id, required this.image, required this.name});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
    );
  }
}
