import 'package:flutter/material.dart';
import 'package:islami_app_new/home/quran/sura_details.dart';

class SuraNameWidget extends StatelessWidget {
  String suraName;
  int ayatNumber;
  int suraIndex;
  SuraNameWidget({required this.suraName,required this.ayatNumber,required this.suraIndex});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(
            context,
            SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgumnet(suraName, suraIndex),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(suraName, style: Theme
              .of(context)
              .textTheme
              .headline3,),
          Text(
            '$ayatNumber',
            style: Theme
                .of(context)
                .textTheme
                .headline3,
          ),

        ],
      ),
    );
  }
}
