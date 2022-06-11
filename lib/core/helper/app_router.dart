import 'package:flutter/material.dart';
import 'package:marvel_universe/model/character/characters_response_model.dart';
import 'package:marvel_universe/splash_view.dart';
import 'package:marvel_universe/view/home/character_detail/character_detail_view.dart';
import 'package:marvel_universe/view/home/characters/characters_view.dart';
import 'package:marvel_universe/view/not_found/not_found_view.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Screens.splashView:
        return PageTransition(
            curve: Curves.easeOutQuint,
            child: const SplashView(),
            settings: settings,
            type: PageTransitionType.fade);
      case Screens.charactersView:
        return PageTransition(
            curve: Curves.easeOutQuint,
            child: const CharactersView(),
            settings: settings,
            type: PageTransitionType.fade);
      case Screens.characterDetailView:
        return PageTransition(
            curve: Curves.easeOutQuint,
            child: CharacterDetailView(model: settings.arguments as Results),
            settings: settings,
            type: PageTransitionType.rightToLeft);
      default:
        return PageTransition(
            curve: Curves.easeOutQuint,
            child: const NotFoundView(),
            settings: settings,
            type: PageTransitionType.fade);
    }
  }
}

class Screens {
  static const String splashView = "/splashView";
  static const String charactersView = "/charactersView";
  static const String characterDetailView = "/characterDetailView";
}
