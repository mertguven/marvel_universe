import 'package:marvel_universe/controller/interfaces/characters_base.dart';
import 'package:marvel_universe/model/character/characters_response_model.dart';
import 'package:marvel_universe/model/character/characters_request_model.dart';
import 'package:marvel_universe/service/network_service.dart';

class CharactersController extends CharactersBase {
  final NetworkService _service = NetworkService();

  @override
  Future<CharactersResponseModel?> fetchCharacters(
      CharactersRequestModel model) {
    return _service.fetchCharacters(model);
  }
}
