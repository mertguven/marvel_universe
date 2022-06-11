import 'package:easy_localization/easy_localization.dart';

abstract class LocaleKeys {
  static final String somethingWentWrong = "somethingWentWrong".tr();
  static final String error = "error".tr();
  static final String pageNotFound = "pageNotFound".tr();
  static final CharacterDetailKeys characterDetail = CharacterDetailKeys();
  static final CharactersKeys characters = CharactersKeys();
}

class CharactersKeys {
  String get characterName => "characters.characterName".tr();
}

class CharacterDetailKeys {
  String get description => "characterDetail.description".tr();
  String get noDescription => "characterDetail.noDescription".tr();
  String get comics => "characterDetail.comics".tr();
  String get noComics => "characterDetail.noComics".tr();
}
