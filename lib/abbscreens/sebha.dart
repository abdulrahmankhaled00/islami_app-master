import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/abbconfigprovider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Sebha extends StatefulWidget {
  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  double angle = 0;
  List<String> tsbe7 = ["سبحان الله", "الحمد لله", "الله اكبر"];
  int number = 0;
  int carantidex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    var mmediaqr = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          SizedBox(height: 40),
          Container(
            height: mmediaqr.height * .31,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Image.asset(
                      provider.darkmode()
                          ? 'assets/images/head_seb7a.png'
                          : 'assets/images/lighthead_seb7a.png',
                      height: mmediaqr.height * .1),
                  top: 3,
                  left: mmediaqr.width * .48,
                ),
                Positioned(
                  bottom: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        ontabfun();
                      });
                    },
                    child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                          provider.darkmode()
                              ? 'assets/images/body_seb7a.png'
                              : 'assets/images/lightbody_seb7a.png',
                          height: mmediaqr.height * .23),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 25),
          Text(
            AppLocalizations.of(context)!.tsabeh,
            style: Theme.of(context).primaryTextTheme.headline2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(25)),
            width: 70,
            height: 70,
            alignment: Alignment.center,
            child: Text(number.toString(),
                style: Theme.of(context).primaryTextTheme.headline3,
                textAlign: TextAlign.center),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(25)),
            width: mmediaqr.width * .3,
            height: 70,
            alignment: Alignment.center,
            child: Text(tsbe7[carantidex],
                style: Theme.of(context).primaryTextTheme.headline3,
                textAlign: TextAlign.center),
          )
        ],
      ),
    );
  }

  ontabfun() {
    number++;
    angle--;
    if (number == 33) {
      number = 0;
      carantidex++;
    }
    if (carantidex == tsbe7.length) {
      setState(() {
        ;
        carantidex = 0;
      });
    }
  }
}
