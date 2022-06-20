import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_universe/cubit/character_detail/character_detail_cubit.dart';
import 'package:marvel_universe/cubit/characters/characters_cubit.dart';

class AppConstants {
  static String get appName => "Marvel Universe";
  static const supportedLocales = [Locale('en'), Locale('tr')];
  static const localizationAssetPath = "assets/translations";
  static List<BlocProvider> multiProviders = [
    BlocProvider<CharactersCubit>(create: (_) => CharactersCubit()),
    BlocProvider<CharacterDetailCubit>(create: (_) => CharacterDetailCubit()),
  ];
}
