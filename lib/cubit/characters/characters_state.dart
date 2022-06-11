part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitialState extends CharactersState {}

class CharactersLoadingState extends CharactersState {}

class CharactersLoadedState extends CharactersState {
  final CharactersResponseModel model;

  CharactersLoadedState(this.model);
}

class CharactersErrorState extends CharactersState {}
