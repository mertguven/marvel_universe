import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_universe/core/constants/app_constants.dart';
import 'package:marvel_universe/core/helper/app_init.dart';
import 'package:marvel_universe/core/helper/app_router.dart';
import 'package:marvel_universe/core/theme/app_theme.dart';

Future<void> main() async {
  await AppInit().appInitial();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      EasyLocalization(
        supportedLocales: AppConstants.supportedLocales,
        path: AppConstants.localizationAssetPath,
        fallbackLocale: AppConstants.supportedLocales.first,
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppConstants.multiProviders,
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: AppConstants.appName,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: Screens.splashView,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
