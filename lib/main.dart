/*
* File : Main File
* Version : 1.0.0
* */

// import 'package:flutkit/apps/fitness/views/splash_screen.dart';

// import 'package:flutkit/homes/homes_screen.dart';
import 'package:shopapp/localizations/app_localization_delegate.dart';
import 'package:shopapp/localizations/language.dart';
import 'package:shopapp/theme/app_notifier.dart';
import 'package:shopapp/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutx/themes/app_theme_notifier.dart';
import 'package:provider/provider.dart';

import 'shopping/views/splash_screen.dart';

Future<void> main() async {
  //You will need to initialize AppThemeNotifier class for theme changes.
  WidgetsFlutterBinding.ensureInitialized();

  AppTheme.init();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ChangeNotifierProvider<AppNotifier>(
    create: (context) => AppNotifier(),
    child: ChangeNotifierProvider<FxAppThemeNotifier>(
      create: (context) => FxAppThemeNotifier(),
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          builder: (context, child) {
            return Directionality(
              textDirection: AppTheme.textDirection,
              child: child!,
            );
          },
          localizationsDelegates: [
            AppLocalizationsDelegate(context),
            // Add this line
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: Language.getLocales(),
          // home: IntroScreen(),
          home: SplashScreen(),
          // home: EstateSplashScreen(),
        );
      },
    );
  }
}
