import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_universe/controller/character_detail_controller.dart';
import 'package:marvel_universe/model/detail/character_comics_request_model.dart';
import 'package:marvel_universe/model/detail/character_comics_response_model.dart';

part 'character_detail_state.dart';

class CharacterDetailCubit extends Cubit<CharacterDetailState> {
  CharacterDetailCubit() : super(CharacterDetailInitialState());

  final CharacterDetailController _controller = CharacterDetailController();

  Future<void> fetchCharacterComics(CharacterComicsRequestModel model) async {
    emit(CharacterDetailLoadingState());
    final response = await _controller.fetchCharacterComics(model);
    if (response != null && response.code == 200) {
      emit(CharacterDetailLoadedState(response));
    } else {
      emit(CharacterDetailErrorState());
    }
  }
}
