import 'package:flutter/material.dart';
import 'package:islami_app_new/home/Providers/setting_provider.dart';
import 'package:provider/provider.dart';

class LangauageBottomSheet extends StatefulWidget {
  @override
  State<LangauageBottomSheet> createState() => _LangauageBottomSheetState();
}

class _LangauageBottomSheetState extends State<LangauageBottomSheet> {
  /*===================[Methods]==========================*/

  Widget getSelectedItem(String text) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 20),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Theme.of(context).primaryColor)),
          Icon(
            Icons.check,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }

  Widget getUnSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }

  /*========================================================*/
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingProvider>(context);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).bottomSheetTheme.backgroundColor,
           borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                settingsProvider.changeLanguage('en');
              },
              child: (settingsProvider.currentLanguage == 'en')
                  ? getSelectedItem('English')
                  : getUnSelectedItem('English')),
          InkWell(
              onTap: () {
                settingsProvider.changeLanguage('ar');
              },
              child: (settingsProvider.currentLanguage == 'ar')
                  ? getSelectedItem('العربية')
                  : getUnSelectedItem('العربية')),
        ],
      ),
    );
  }
}
