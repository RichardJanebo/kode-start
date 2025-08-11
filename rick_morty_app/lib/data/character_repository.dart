import 'package:dio/dio.dart';
import 'package:rick_morty_app/mock/mock_character_card.dart';
import 'package:rick_morty_app/mock/mock_character_detail.dart';
import 'package:rick_morty_app/models/character_detail_model.dart';
import 'package:rick_morty_app/models/character_model.dart';

abstract class CharacterRepository {
  static final _dio = Dio(BaseOptions(baseUrl: "https://rickandmortyapi.com/"));

  static Future<List<CharacterModel>> getAllCharacters() async {
    try {
      var response = await _dio.get("api/character");
      List result = response.data['results'];

      return result.map((json) => CharacterModel.fromJson(json)).toList();
    } catch (e) {
      print('Erro na API, carregando mock: $e');
      return MockCharacterRepository.getAllCharacters();
    }
  }

  static Future<List<CharacterModel>> getCharacterByName(String name) async {
    try {
      var response = await _dio.get('api/character?name=$name');
      List result = response.data['results'];

      return result.map((json) => CharacterModel.fromJson(json)).toList();
    } catch (e) {
      print('Erro na API, carregando mock: $e');
      return MockCharacterSearchRepository.getCharacterByName(name);
    }
  }

  static Future<CharacterDetailsModel> getCharacterById(int id) async {
    try {
      var response = await _dio.get('api/character/$id');
      var result = response.data;
      var episodeName = getEpsodeName(result['episode'][0]);

      return CharacterDetailsModel(
        image: result['image'],
        name: result['name'],
        species: result['species'],
        status: result['status'],
        location: result['location']['name'],
        episode: await episodeName,
      );
    } catch (e) {
      print('Erro na API, carregando mock: $e');

      return MockCharacterDetailRepository.getCharacterById(id);
    }
  }

  static Future<String> getEpsodeName(String epsodepath) async {
    String episodeNumber = epsodepath.split("/").last;

    var response = await _dio.get("api/episode/$episodeNumber");
    var result = response.data['name'];
    print(result);
    return result;
  }
}
