import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/abbscreens/7adeth/ahades.dart';
import 'package:untitled/abbscreens/quran/quran.dart';
import 'package:untitled/abbscreens/radio.dart';
import 'package:untitled/abbscreens/sebha.dart';
import 'package:untitled/abbscreens/settings/settings.dart';
import 'package:untitled/provider/abbconfigprovider.dart';
import 'package:untitled/themedata.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Homescreen extends StatefulWidget {
  static String routname = 'Home';

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int numicon = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.darkmode()
                  ? 'assets/images/darkquran.png'
                  : 'assets/images/quran.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami,
              style: Theme.of(context).primaryTextTheme.headline1),
        ),
        body: myscreen[numicon],
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Theme.of(context).primaryColor),
          child: BottomNavigationBar(
            currentIndex: numicon,
            onTap: (index) {
              numicon = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/tab_quran.png')),
                  label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/sebha.png')),
                  label: AppLocalizations.of(context)!.sebha),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/ahades.png')),
                  label: AppLocalizations.of(context)!.ahadeth),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/radio.png')),
                  label: AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 24,
                  ),
                  label: AppLocalizations.of(context)!.settings)
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> myscreen = [
    Quran(),
    Sebha(),
    Ahades(),
    Radioxe(),
    Settingsapp()
  ];
}
