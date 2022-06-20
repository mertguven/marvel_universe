import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_universe/model/character/characters_request_model.dart';
import 'package:marvel_universe/model/detail/character_comics_request_model.dart';
import 'package:marvel_universe/service/network_service.dart';

void main() {
  test("Fetching marvel characters from api based on given offset", () async {
    final NetworkService networkService = NetworkService();
    const int offset = 0;
    final response = await networkService
        .fetchCharacters(CharactersRequestModel(offset: offset));

    if (response != null) {
      expect(response.code, 200);
    }
  });
  test(
      "Fetch the comics from API from 2005 to present, newest to oldest, with a limit of 10 based on given characterId",
      () async {
    final NetworkService networkService = NetworkService();
    const int characterId = 1009726;
    final response = await networkService
        .fetchCharacterComics(const CharacterComicsRequestModel(characterId));

    if (response != null) {
      expect(response.code, 200);
    }
  });
}
