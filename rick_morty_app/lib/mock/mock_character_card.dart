import 'package:rick_morty_app/models/character_model.dart';

class MockCharacterRepository {
  static Future<List<CharacterModel>> getAllCharacters() async {
    await Future.delayed(Duration(seconds: 1)); // simula delay de rede
    return [
      CharacterModel(
        id: 1,
        name: "Rick Sanchez MOCK",
        image: "lib/assets/imagesmock/1.png",
      ),
      CharacterModel(
        id: 2,
        name: "Morty Smith MOCK",
        image: "lib/assets/imagesmock/2.png",
      ),
      CharacterModel(
        id: 3,
        name: "Summer Smith MOCK",
        image: "lib/assets/imagesmock/3.png",
      ),
      CharacterModel(
        id: 4,
        name: "Beth Smith MOCK",
        image: "lib/assets/imagesmock/4.png",
      ),
      CharacterModel(
        id: 5,
        name: "Jerry Smith MOCK",
        image: "lib/assets/imagesmock/5.png",
      ),
      // Adicione mais personagens com id, nome e caminho da imagem local aqui
    ];
  }
}

class MockCharacterSearchRepository {
  static final List<CharacterModel> _allCharacters = [
    CharacterModel(
      id: 1,
      name: "Rick Sanchez MOCK",
      image: "assets/imagesmock/1.png",
    ),
    CharacterModel(
      id: 2,
      name: "Morty Smith MOCK",
      image: "assets/imagesmock/2.png",
    ),
    CharacterModel(
      id: 3,
      name: "Summer Smith MOCK",
      image: "assets/imagesmock/3.png",
    ),
    CharacterModel(id: 4, name: "Beth Smith", image: "assets/imagesmock/4.png"),
    CharacterModel(
      id: 5,
      name: "Jerry Smith MOCK",
      image: "assets/imagesmock/5.png",
    ),
  ];

  static Future<List<CharacterModel>> getCharacterByName(String name) async {
    await Future.delayed(const Duration(milliseconds: 500)); // simula delay

    final lowerName = name.toLowerCase();
    final filtered = _allCharacters
        .where((character) => character.name.toLowerCase().contains(lowerName))
        .toList();

    return filtered;
  }
}
