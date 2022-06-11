// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:marvel_universe/controller/characters_controller.dart';
import 'package:marvel_universe/model/character/characters_request_model.dart';
import 'package:marvel_universe/model/character/characters_response_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(CharactersInitialState());
  final CharactersController _controller = CharactersController();

  Future<void> fetchCharacters(CharactersRequestModel model) async {
    if (model.offset == 0) {
      emit(CharactersLoadingState());
    }
    final response = await _controller.fetchCharacters(model);
    if (response != null && response.code == 200) {
      emit(CharactersLoadedState(response));
    } else {
      emit(CharactersErrorState());
    }
  }
}
