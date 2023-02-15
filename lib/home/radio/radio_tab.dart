import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islami_app_new/home/Providers/setting_provider.dart';
import 'package:islami_app_new/home/radio/radio_controller.dart';
import 'package:provider/provider.dart';

import '../../Model/RadioResponse.dart';
import '../../my_theme.dart';

// API LINK => http://api.mp3quran.net/radios/radio_arabic.json
// WEBSITE => https://mp3quran.net/eng

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {

  /*=====================[Variables]================*/

  late Future<RadioResponse> radioResponse;
  late AudioPlayer audioPlayer;

  /*=============================================*/

  /*=====================[Methods]================*/
  @override
  void initState() {
    super.initState();
    radioResponse = fetchRadio();
    audioPlayer = AudioPlayer();
  }


  // Future<RadioResponse> fetchRadio() async {
  //   Uri url  = Uri.parse('http://api.mp3quran.net/radios/radio_arabic.json');
  //   final response = await http.get(url);
  //
  //   if (response.statusCode == 200) {
  //      String responseBody = response.body;
   //
  //      Map<String,dynamic> json = jsonDecode(responseBody);
  //     [ Map<String,dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));]
  //     return RadioResponse.fromJson(json);
  //   }
  //   else{
  //     throw Exception('Failed to load radio response');
  //   }
  //
  // }

  Future<RadioResponse> fetchRadio() async {
    Uri url = Uri.parse('http://api.mp3quran.net/radios/radio_arabic.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
      return RadioResponse.fromJson(json);
    } else {
      throw Exception('Failed to load radio response');
    }
  }

  play(String url) async {
    await audioPlayer.play(UrlSource(url));
  }

  pause() async {
    await audioPlayer.pause();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }
  /*=============================================*/
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of(context);

    return FutureBuilder<RadioResponse>(
      future: radioResponse,
      builder: (buildContext, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: IconButton(
                onPressed: () {
                  radioResponse = fetchRadio();
                },
                icon: Icon(
                  Icons.refresh,
                  color: MyTheme.colorGold,
                  size: 40,
                )),
          );
        }
        else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else {
          return
            // Text(snapshot.data!.radios![0].name ?? '');
            Column(  //=>> Start from here
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(settingProvider.isDarkMode()
                    ? 'assets/images/radio_dark.png'
                    : 'assets/images/radio_light.png'),
              ),
              Expanded(
                  flex: 1,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: PageScrollPhysics(),
                      itemCount: snapshot.data!.radios!.length,
                      itemBuilder: (_, index) {
                        return RadioController(
                          radios: snapshot.data!.radios![index],
                          play:  (){play(snapshot.data!.radios![index].radioUrl ?? '');},
                          pause: (){pause();},
                        );
                      })),
            ],
          );
        }
      },
    );
  }
}
