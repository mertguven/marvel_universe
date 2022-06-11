import 'package:flutter/material.dart';
import 'package:marvel_universe/core/constants/assets_constants.dart';
import 'package:marvel_universe/core/extensions/context_extension.dart';
import 'package:marvel_universe/core/helper/app_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final String _imagePath = AssetsConstants.logo;

  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.pushNamedAndRemoveUntil(
          context, Screens.charactersView, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.error,
      body: Align(
        alignment: Alignment.center,
        child: Image.asset(
          _imagePath,
          width: context.screenWidth * 0.9,
          height: double.infinity,
        ),
      ),
    );
  }
}
