import 'package:marvel_universe/model/character/characters_request_model.dart';
import 'package:marvel_universe/model/character/characters_response_model.dart';

abstract class CharactersBase {
  Future<CharactersResponseModel?> fetchCharacters(
      CharactersRequestModel model);
}
