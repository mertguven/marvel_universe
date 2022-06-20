import 'package:marvel_universe/controller/interfaces/character_detail_base.dart';
import 'package:marvel_universe/model/detail/character_comics_response_model.dart';
import 'package:marvel_universe/model/detail/character_comics_request_model.dart';
import 'package:marvel_universe/service/network_service.dart';

class CharacterDetailController extends CharacterDetailBase {
  final NetworkService _service = NetworkService();

  @override
  Future<CharacterComicsResponseModel?> fetchCharacterComics(
      CharacterComicsRequestModel model) {
    return _service.fetchCharacterComics(model);
  }
}
