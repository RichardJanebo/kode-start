import 'package:rick_morty_app/models/character_detail_model.dart';

class MockCharacterDetailRepository {
  static Future<CharacterDetailsModel> getCharacterById(int id) async {
    await Future.delayed(const Duration(milliseconds: 500)); // simula delay

    switch (id) {
      case 1:
        return CharacterDetailsModel(
          image: 'assets/imagesmock/1.png',
          name: 'Rick Sanchez MOCK',
          species: 'Human',
          status: 'Alive',
          location: 'Earth',
          episode: 'Pilot',
        );
      case 2:
        return CharacterDetailsModel(
          image: 'assets/imagesmock/2.png',
          name: 'Morty Smith MOCK',
          species: 'Human',
          status: 'Alive',
          location: 'Earth',
          episode: 'Pilot',
        );
      case 3:
        return CharacterDetailsModel(
          image: 'assets/imagesmock/3.png',
          name: 'Summer Smith MOCK',
          species: 'Human',
          status: 'Alive',
          location: 'Earth',
          episode: 'Pilot',
        );
      case 4:
        return CharacterDetailsModel(
          image: 'assets/imagesmock/4.png',
          name: 'Beth Smith MOCK',
          species: 'Human',
          status: 'Alive',
          location: 'Earth',
          episode: 'Pilot',
        );
      case 5:
        return CharacterDetailsModel(
          image: 'assets/imagesmock/5.png',
          name: 'Jerry Smith MOCK',
          species: 'Human',
          status: 'Alive',
          location: 'Earth',
          episode: 'Pilot',
        );
      default:
        return CharacterDetailsModel(
          image: 'assets/imagesmock/default.png',
          name: 'Unknown',
          species: 'Unknown',
          status: 'Unknown',
          location: 'Unknown',
          episode: 'Unknown',
        );
    }
  }
}
