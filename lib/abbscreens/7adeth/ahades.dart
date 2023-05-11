import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled/abbscreens/7adeth/hadeth_detals.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/provider/abbconfigprovider.dart';
import 'package:untitled/themedata.dart';

class Ahades extends StatefulWidget {
  @override
  State<Ahades> createState() => _AhadesState();
}

class _AhadesState extends State<Ahades> {
  @override
  List<hadethdata> hadeth77 = [];

  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    if (hadeth77.isEmpty) {
      loadahdethfile();
    }
    return Column(
      children: [
        Center(
            child: Image.asset(
          'assets/images/hadeth_image.png',
        )),
        Divider(
          color: provider.darkmode()
              ? Themedata.yellowcolor
              : Themedata.primarylight,
          thickness: 2,
        ),
        Text(
          AppLocalizations.of(context)!.hadethname,
          style: Theme.of(context).primaryTextTheme.headline2,
        ),
        Divider(
          color: provider.darkmode()
              ? Themedata.yellowcolor
              : Themedata.primarylight,
          thickness: 2,
        ),
        Expanded(
            child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: provider.darkmode()
                ? Themedata.yellowcolor
                : Themedata.primarylight,
            thickness: 2,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              child: Text(
                hadeth77[index].title,
                textAlign: TextAlign.center,
                style: Theme.of(context).primaryTextTheme.headline3,
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(Hadethdetails.routname, arguments: {
                  'hadethtitle': hadeth77[index].title,
                  'hadethcon': hadeth77[index].content,
                });
              },
            );
          },
          itemCount: hadeth77.length,
        ))
      ],
    );
  }

  void loadahdethfile() async {
    String Allahadeth = await rootBundle.loadString('assets/files/ahadeth.txt');

    List<String> Onehadeth = Allahadeth.split('#\r\n');
    for (int i = 0; i < Onehadeth.length; i++) {
      List<String> lineshadeth = Onehadeth[i].split('\n');
      String title = lineshadeth[0];
      lineshadeth.removeAt(0);
      hadethdata hadethcon = hadethdata(title: title, content: lineshadeth);
      hadeth77.add(hadethcon);
    }

    setState(() {});
  }
}

class hadethdata {
  String title;
  List<String> content;

  hadethdata({required this.title, required this.content});
}
