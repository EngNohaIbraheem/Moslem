import 'package:flutter/material.dart';
import 'package:islami_app_new/generated/l10n.dart';
import 'package:islami_app_new/home/Providers/setting_provider.dart';
import 'package:islami_app_new/home/hadeth/hadeth_tab.dart';
import 'package:islami_app_new/my_theme.dart';
import 'package:provider/provider.dart';


class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth_details_screen';

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments as Hadeth;
    var settingsProvider = Provider.of<SettingProvider>(context);
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(settingsProvider.isDarkMode()
                    ? 'assets/images/main_background_dark.png'
                    : 'assets/images/main_background_light.jpg'),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              (settingsProvider.currentLanguage == 'en')
                  ? S.of(context).app_title
                  : S.of(context).app_title,
            ),
            centerTitle: Theme.of(context).appBarTheme.centerTitle,
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 64),
            padding: const EdgeInsets.all(20),
            height: 700,
            decoration: BoxDecoration(
              color: settingsProvider.isDarkMode()
                  ? MyTheme.colorDarkBlue
                  : Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Text(
                  arguments.hadethTitle,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: settingsProvider.isDarkMode()
                          ? Color(0xFFFACC1D)
                          : Colors.black),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: double.infinity,
                  height: 1.5,
                  color: Theme.of(context).primaryColor,
                ),
                Expanded(
                  child: SingleChildScrollView(
                      child: Text(
                    arguments.hadethContent,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: settingsProvider.isDarkMode()
                            ? Color(0xFFFACC1D)
                            : Colors.black),
                    textDirection: TextDirection.rtl,
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
