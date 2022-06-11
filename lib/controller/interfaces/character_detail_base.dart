import 'package:marvel_universe/model/detail/character_comics_request_model.dart';
import 'package:marvel_universe/model/detail/character_comics_response_model.dart';

abstract class CharacterDetailBase {
  Future<CharacterComicsResponseModel?> fetchCharacterComics(
      CharacterComicsRequestModel model);
}
