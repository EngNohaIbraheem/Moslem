import 'package:flutter/material.dart';
import 'package:islami_app_new/home/Providers/setting_provider.dart';
import 'package:islami_app_new/home/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'language_bottom_sheet.dart';
import 'package:islami_app_new/generated/l10n.dart';


class SettingTab extends StatefulWidget {

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  /*===================[Variables]==========================*/
  /*========================================================*/

  /*===================[Methods]==========================*/
  void showLanguageBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (buildContext) {
          return LangauageBottomSheet();
        });
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (buildContext) {
          return ThemeBottomSheet();
        });
  }

  /*========================================================*/


  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingProvider>(context);
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(S
              .of(context)
              .language, style: Theme
              .of(context)
              .textTheme
              .bodyText1,),
          const SizedBox(height: 5,),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).bottomSheetTheme.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border:
                  Border.all(width: 1, color: Theme
                      .of(context)
                      .primaryColor),
                ),
                child: Text((settingsProvider.currentLanguage == 'en') ? S
                    .of(context)
                    .english :  S.of(context).arabic,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline5,
                )),
          ),

          SizedBox(height: 16,),

          Text(S.of(context).theme, style: Theme
              .of(context)
              .textTheme
              .bodyText1,),
          SizedBox(height: 5,),

          InkWell(
            onTap: (){
              showThemeBottomSheet();
            },
            child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).bottomSheetTheme.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border:
                  Border.all(width: 1, color: Theme
                      .of(context)
                      .primaryColor),
                ),
                child: Text(
                  (settingsProvider.currentTheme == ThemeMode.dark)? S.of(context).dark : S.of(context).light ,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline5,
                )),
          ),

        ],
      ),
    );
  }
}
