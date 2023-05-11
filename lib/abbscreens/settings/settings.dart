import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/abbscreens/settings/Bottomsheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/abbscreens/settings/themebuttmsheet.dart';
import 'package:untitled/provider/abbconfigprovider.dart';

class Settingsapp extends StatelessWidget {
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language,
              style: Theme.of(context).primaryTextTheme.headline2),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        provider.languge == 'en'
                            ? AppLocalizations.of(context)!.english
                            : AppLocalizations.of(context)!.arabic,
                        style: Theme.of(context).primaryTextTheme.headline2),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: (context) => Bottumsheet());
                }),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).primaryColor),
          ),
          SizedBox(height: 25),
          Text(AppLocalizations.of(context)!.theming,
              style: Theme.of(context).primaryTextTheme.headline2),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        provider.apptheme == ThemeMode.light
                            ? AppLocalizations.of(context)!.light
                            : AppLocalizations.of(context)!.dark,
                        style: Theme.of(context).primaryTextTheme.headline2),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => themebottomsheet());
                }),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}
