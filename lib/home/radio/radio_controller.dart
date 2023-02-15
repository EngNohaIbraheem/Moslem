 import 'package:flutter/material.dart';
import 'package:islami_app_new/Model/RadioResponse.dart';
import 'package:islami_app_new/home/Providers/setting_provider.dart';
import 'package:islami_app_new/my_theme.dart';
import 'package:provider/provider.dart';

class RadioController extends StatelessWidget {

  /*=====================[Variables]================*/

  Radios radios;
  // AudioPlayer  audioPlayer  = AudioPlayer(); make it initialize in initState
  Function play;
  Function pause;

  RadioController({required this.radios,required this.play,required this.pause});
  /*=============================================*/


  /*=====================[Methods]================*/

  //
  //
  // play() async {
  //   await audioPlayer.play(UrlSource(radios.radioUrl?? ''));
  // }
  //
  // pause()async{
  //       await audioPlayer.pause();
  // }
  /*=============================================*/

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of(context);

    return Container( //=>> Start from here
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
             radios.name ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color:
                    settingProvider.isDarkMode() ? Colors.white : Colors.black),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                padding: EdgeInsets.symmetric(horizontal: 25),
                  onPressed: () {
                  pause();
                  },
                  icon: Icon(
                    Icons.pause,
                    size: 40,
                  ),
                  color: settingProvider.isDarkMode()
                      ? MyTheme.colorYellow
                      : MyTheme.colorGold),
              IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  onPressed: () {
                    play();
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    size: 40,
                  ),
                  color: settingProvider.isDarkMode()
                      ? MyTheme.colorYellow
                      : MyTheme.colorGold),
            ],
          ),
        ],
      ),
    );
  }
}
