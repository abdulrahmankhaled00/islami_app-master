import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/abbconfigprovider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Bottumsheet extends StatefulWidget {
  @override
  State<Bottumsheet> createState() => _BottumsheetState();
}

class _BottumsheetState extends State<Bottumsheet> {
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {
                provider.changlanguge('en');
              },
              child: provider.languge == 'en'
                  ? selctedlanguage(AppLocalizations.of(context)!.english)
                  : unselctedlanguage(AppLocalizations.of(context)!.english),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
                onTap: () {
                  provider.changlanguge('ar');
                },
                child: provider.languge == 'ar'
                    ? selctedlanguage(AppLocalizations.of(context)!.arabic)
                    : unselctedlanguage(AppLocalizations.of(context)!.arabic))
          ],
        ),
      ),
    );
  }

  Widget selctedlanguage(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$text',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        Icon(Icons.check)
      ],
    );
  }

  Widget unselctedlanguage(String text) {
    return Text(
      '$text',
      style: Theme.of(context)
          .primaryTextTheme
          .headline3!
          .copyWith(color: Colors.black),
    );
  }
}
