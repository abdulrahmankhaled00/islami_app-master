import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/abbconfigprovider.dart';
import 'package:untitled/themedata.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Radioxe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/radio_image.png'),
          SizedBox(
            height: 25,
          ),
          Text(
            AppLocalizations.of(context)!.quranezaa,
            style: Theme.of(context).primaryTextTheme.headline2,
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.skip_previous,
                  color: provider.darkmode()
                      ? Themedata.yellowcolor
                      : Themedata.primarylight,
                  size: 40),
              SizedBox(width: 25),
              Icon(
                Icons.play_arrow,
                color: provider.darkmode()
                    ? Themedata.yellowcolor
                    : Themedata.primarylight,
                size: 40,
              ),
              SizedBox(width: 25),
              Icon(Icons.skip_next,
                  color: provider.darkmode()
                      ? Themedata.yellowcolor
                      : Themedata.primarylight,
                  size: 40),
            ],
          )
        ],
      ),
    );
  }
}
