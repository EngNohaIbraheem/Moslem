import 'package:flutter/material.dart';
import 'package:islami_app_new/home/Providers/setting_provider.dart';
import 'package:provider/provider.dart';

class VerseWidget extends StatelessWidget {
  String suraContent;
  int suraIndex;

  VerseWidget({required this.suraContent, required this.suraIndex});

  @override
  Widget build(BuildContext context) {
   var settingsProvider = Provider.of<SettingProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Text(
        '{ ${suraIndex + 1} }   $suraContent',
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
            color: settingsProvider.isDarkMode()
                ? Color(0xFFFACC1D)
                : Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }
}
