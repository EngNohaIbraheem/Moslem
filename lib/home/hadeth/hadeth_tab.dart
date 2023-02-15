import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_new/home/hadeth/hadeth_name_widget.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  /*===================[Variables]==========================*/
  List<Hadeth> allHadethOfFile = [];

  /*========================================================*/

  /*===================[Methods]==========================*/

  void readHadethFile() async {
    String hadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allHadeth = hadethContent.trim().split('#');
    for (int i = 0; i < allHadeth.length; i++) {

      List<String> hadethLines = allHadeth[i].trim().split('\n');
      String hadethTitle = hadethLines[0];

      hadethLines.removeAt(0);
      String hadethContent = hadethLines.join('\n');

      Hadeth hadeth =
          Hadeth(hadethTitle: hadethTitle, hadethContent: hadethContent);
      allHadethOfFile.add(hadeth);
      setState(() {});
    }
  }

  /*========================================================*/
  @override
  Widget build(BuildContext context) {
    if (allHadethOfFile.isEmpty) {
      readHadethFile();
    }

    return Column(
      children: [
        Image.asset(
          'assets/images/hadeth_header_image.png',
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(
                    color: Theme.of(context).primaryColor, width: 1.5)),
          ),
          child: Text('الأحاديث', style: Theme.of(context).textTheme.headline4),
        ),
        (allHadethOfFile.isEmpty)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(
                child: ListView.separated(
                itemCount: allHadethOfFile.length,
                itemBuilder: (context, index) {
                  return HadethNameWidget(
                    hadeth: allHadethOfFile[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 64),
                    width: double.infinity,
                    height: 1.5,
                    color: Theme.of(context).primaryColor,
                  );
                },
              ))
      ],
    );
  }
}

class Hadeth {
  String hadethTitle;
  String hadethContent;

  Hadeth({required this.hadethTitle, required this.hadethContent});
}
