import 'package:flutter/material.dart';
import 'package:islami_app_new/home/hadeth/hadeth_tab.dart';
import 'package:islami_app_new/home/settings/setiting.dart';
import 'package:islami_app_new/home/quran/quran_tab.dart';
import 'package:islami_app_new/home/radio/radio_tab.dart';
import 'package:islami_app_new/home/sebha/sebha_tab.dart';



 import 'package:islami_app_new/generated/l10n.dart';
import 'package:provider/provider.dart';

import 'Providers/setting_provider.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedItem = 0;
  List<Widget> tabs = [QuranTab(),HadethTab(),SebhaTab(),RadioTab(),SettingTab()];

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingProvider>(context);
     return SafeArea(
      child: Container(
          decoration:   BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(settingsProvider.isDarkMode()? 'assets/images/main_background_dark.png':'assets/images/main_background_light.jpg')  ,
                  fit: BoxFit.fill)),
          child: Scaffold(
             appBar: AppBar(
               title:   Text(S.of(context).app_title),
               centerTitle: Theme.of(context).appBarTheme.centerTitle,
             ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedItem,
              onTap: (index) {
                setState(() {
                  selectedItem = index;
                });
              },

              items:   [
                BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                     icon: ImageIcon(AssetImage('assets/images/ic_quran.png')),
                    label: S.of(context).quran_title),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,

                    icon:
                        ImageIcon(AssetImage('assets/images/ic_hadeth.png')),
                    label: S.of(context).hadeth_title),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,

                    icon: ImageIcon(AssetImage('assets/images/ic_sebha.png')),
                    label: S.of(context).tasbeh_title),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,

                    icon: ImageIcon(AssetImage('assets/images/ic_radio.png')),
                    label: S.of(context).radio_title),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,

                    icon: Icon(Icons.settings),
                    label: S.of(context).setting_title),
              ],
            ),

            body: tabs[selectedItem],
          )),
    );
  }
}
