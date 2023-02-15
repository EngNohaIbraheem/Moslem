import 'package:flutter/material.dart';
import 'package:islami_app_new/home/Providers/setting_provider.dart';
import 'package:islami_app_new/my_theme.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  /*=================[Variables]================*/
  double angle = 0;
  int tasbehat = 0;
  int currentIndex = 0;
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
  ];

  /*==========================================*/

  /*=================[Methods]================*/

  void rotateSebhaBody() {
    setState(() {
      angle--;
      tasbehat++;
      if (tasbehat == 34) {
        tasbehat = 0;
        currentIndex++;
      }
      if (currentIndex > azkar.length - 1) {
        currentIndex = 0;
      }
    });
  }

  /*==========================================*/

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingProvider>(context);

    return Container(
        width: double.infinity,
        // alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .46,
              child: Stack(
                children: [
                  Positioned(
                      left: MediaQuery.of(context).size.width * .45,
                      child: Image.asset(
                        settingsProvider.isDarkMode()
                            ? 'assets/images/sebha_head_dark.png'
                            : 'assets/images/sebha_head_light.png',
                      )),
                  Positioned(
                    top: 80,
                    left: MediaQuery.of(context).size.width * .22,
                    child: InkWell(
                      onTap: () {
                        rotateSebhaBody();
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Transform.rotate(
                        angle: angle,
                        child: Image.asset(
                          settingsProvider.isDarkMode()
                              ? 'assets/images/sebha_body_dark.png'
                              : 'assets/images/sebha_body_light.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'عدد التسبيحات',
              style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: settingsProvider.isDarkMode()
                      ? Colors.white
                      : Colors.black),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: 60,
              height: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: settingsProvider.isDarkMode()
                    ? MyTheme.colorDarkBlue
                    : MyTheme.colorGold,
              ),
              child: Text(
                '$tasbehat',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: settingsProvider.isDarkMode()
                        ? Colors.white
                        : Colors.black),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              width: 135,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: settingsProvider.isDarkMode()
                    ? MyTheme.colorYellow
                    : MyTheme.colorGold,
              ),
              child: Text(
                azkar[currentIndex],
                style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: settingsProvider.isDarkMode()
                        ? Colors.black
                        : Colors.white),
              ),
            )
          ],
        ));
  }
}
