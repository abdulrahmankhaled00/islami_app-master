import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/abbscreens/7adeth/hadeth_detals.dart';
import 'package:untitled/home_screen.dart';
import 'package:untitled/abbscreens/quran/suraname-details.dart';
import 'package:untitled/provider/abbconfigprovider.dart';
import 'package:untitled/themedata.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: Myapp(),
    create: (context) => Appconfigprovider(),
  ));
}

class Myapp extends StatelessWidget {
  late Appconfigprovider provider;

  Widget build(BuildContext context) {
    // TODO: implement build
    provider = Provider.of<Appconfigprovider>(context);
    getshared();
    return MaterialApp(
        theme: Themedata.lighttheme,
        darkTheme: Themedata.darkthem,
        routes: {
          Homescreen.routname: (context) => Homescreen(),
          Sura_detals.routname: (context) => Sura_detals(),
          Hadethdetails.routname: (context) => Hadethdetails()
        },
        initialRoute: Homescreen.routname,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(provider.languge),
        themeMode: provider.apptheme);
  }

  getshared() async {
    final prefs = await SharedPreferences.getInstance();
    String applang = prefs.getString('lang') ?? 'en';
    provider.changlanguge(applang);
    String? apptheme = prefs.getString('theme');
    if (applang == 'light') {
      provider.changtheme(ThemeMode.light);
    } else if (applang == 'dark') {
      provider.changtheme(ThemeMode.dark);
    }
  }
}
