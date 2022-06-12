import 'package:flutter/material.dart';
import 'package:marvel_universe/core/helper/app_router.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    Future.delayed(const Duration(milliseconds: 1500), () {
      FlutterNativeSplash.remove();
      Navigator.pushNamedAndRemoveUntil(
          context, Screens.charactersView, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
