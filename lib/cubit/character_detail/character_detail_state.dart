part of 'character_detail_cubit.dart';

@immutable
abstract class CharacterDetailState {}

class CharacterDetailInitialState extends CharacterDetailState {}

class CharacterDetailLoadingState extends CharacterDetailState {}

class CharacterDetailLoadedState extends CharacterDetailState {
  final CharacterComicsResponseModel model;

  CharacterDetailLoadedState(this.model);
}

class CharacterDetailErrorState extends CharacterDetailState {}
