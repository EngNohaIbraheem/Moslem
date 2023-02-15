import 'package:flutter/material.dart';
import 'package:islami_app_new/home/Providers/setting_provider.dart';
import 'package:islami_app_new/home/hadeth/hadeth_details_screen.dart';
import 'package:islami_app_new/home/home_screen.dart';
import 'package:islami_app_new/home/quran/sura_details.dart';
import 'package:islami_app_new/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';



void main() {
  runApp(ChangeNotifierProvider<SettingProvider>(
    create: (BuildContext context) {
      return SettingProvider();
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  /*==================[Variables]======================*/
    late SettingProvider settingsProvider;
  /*================================================*/

  /*==================[Methods]======================*/
  void getValueFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    settingsProvider.changeLanguage(prefs.getString('language') ?? 'en');

    if(prefs.getString('theme')=='dark'){
      settingsProvider.changeTheme(ThemeMode.dark);
    }else if(prefs.getString('theme')=='light'){
      settingsProvider.changeTheme(ThemeMode.light);
    }
  }

  /*================================================*/

  @override
  Widget build(BuildContext context) {

    settingsProvider = Provider.of<SettingProvider>(context);
    getValueFromSharedPreferences();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: settingsProvider.currentLanguage,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: settingsProvider.currentTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
      },
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale(settingsProvider.currentLanguage),
     );
  }
}
