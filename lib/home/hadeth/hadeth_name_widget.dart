import 'package:flutter/material.dart';
import 'package:islami_app_new/home/hadeth/hadeth_details_screen.dart';
import 'hadeth_tab.dart';

class HadethNameWidget extends StatelessWidget {
  Hadeth hadeth;

  HadethNameWidget({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          HadethDetailsScreen.routeName,
          arguments: hadeth
        );
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          hadeth.hadethTitle,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
