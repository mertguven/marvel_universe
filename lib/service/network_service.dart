import 'package:dio/dio.dart';
import 'package:marvel_universe/controller/interfaces/character_detail_base.dart';
import 'package:marvel_universe/controller/interfaces/characters_base.dart';
import 'package:marvel_universe/core/constants/api_constants.dart';
import 'package:marvel_universe/core/utilities/global_variables.dart';
import 'package:marvel_universe/model/character/characters_request_model.dart';
import 'package:marvel_universe/model/character/characters_response_model.dart';
import 'package:marvel_universe/model/detail/character_comics_request_model.dart';
import 'package:marvel_universe/model/detail/character_comics_response_model.dart';

class NetworkService implements CharactersBase, CharacterDetailBase {
  final _dio = Dio();

  final Map<String, dynamic> _queryParameters = {
    "ts": 1,
    "apikey": ApiConstants.apiKey,
    "hash": ApiConstants.hash
  };

  /* ROUTE FORMAT
    characters => "?offset=5&"
    comics => "/1016823/comics"
  */

  @override
  Future<CharactersResponseModel?> fetchCharacters(
      CharactersRequestModel model) async {
    try {
      const int limit = 30;
      var response = await _dio.get(
        GlobalVariables.url("?offset=${model.offset}&limit=$limit"),
        queryParameters: _queryParameters,
      );
      final res = CharactersResponseModel.fromJson(response.data);
      return res;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<CharacterComicsResponseModel?> fetchCharacterComics(
      CharacterComicsRequestModel model) async {
    try {
      final DateTime dateTime = DateTime.now();
      String dateRange =
          "2005-01-01%2C${dateTime.year}-${dateTime.month}-${dateTime.day}";
      const String orderBy = "-modified";
      const int limit = 10;
      var response = await _dio.get(
        GlobalVariables.url(
            "/${model.id}/comics?dateRange=$dateRange&orderBy=$orderBy&limit=$limit"),
        queryParameters: _queryParameters,
      );

      final res = CharacterComicsResponseModel.fromJson(response.data);
      return res;
    } catch (e) {
      return null;
    }
  }
}
