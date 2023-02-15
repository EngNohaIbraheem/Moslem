import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_new/generated/l10n.dart';
import 'package:islami_app_new/home/Providers/setting_provider.dart';
import 'package:islami_app_new/home/quran/verse_widget.dart';
import 'package:islami_app_new/my_theme.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  /*===================[Variables]==========================*/

  List<String> verses = [];

  /*========================================================*/
  /*===================[Methods]==========================*/
  void readFile(int suraIndex) async {
    String suraContent =
        await rootBundle.loadString('assets/files/${suraIndex + 1}.txt');
    List<String> suraLines = suraContent.trim().split('\n');
    verses = suraLines;
    setState(() {});
  }

  /*========================================================*/

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingProvider>(context);
    var arguments =
        ModalRoute.of(context)!.settings.arguments as SuraDetailsArgumnet;

    if (verses.isEmpty) {
      readFile(arguments.suraIndex);
    }
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
            body: (verses.isEmpty)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 40),
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: settingsProvider.isDarkMode()
                          ? MyTheme.colorDarkBlue
                          : Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                arguments.suraName,
                                style: Theme.of(context).textTheme.headline4?.copyWith(
                                  color: settingsProvider.isDarkMode()?  Color(0xFFFACC1D):Colors.black
                                ),
                              ),
                            ),
                            Icon(
                              Icons.play_circle,
                              color: settingsProvider.isDarkMode()
                                  ? Color(0xFFFACC1D)
                                  : Colors.black,
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          width: double.infinity,
                          height: 1.5,
                          color: Theme.of(context).primaryColor,
                        ),
                        Expanded(
                            child: ListView.separated(
                          itemCount: verses.length,
                          itemBuilder: (context, index) {
                            return VerseWidget(
                              suraContent: verses[index],
                              suraIndex: index,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Divider(
                                color: Theme.of(context).primaryColor,
                                thickness: 1.5,
                              ),
                            );
                          },
                        ))
                      ],
                    ),
                  )),
      ),
    );
  }
}

// data class to pass data from route to another
class SuraDetailsArgumnet {
  String suraName;
  int suraIndex;

  SuraDetailsArgumnet(this.suraName, this.suraIndex);
}
