import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled/abbscreens/quran/quran.dart';
import 'package:untitled/provider/abbconfigprovider.dart';
import 'package:untitled/themedata.dart';

class Sura_detals extends StatefulWidget {
  static String routname = 'sura-name';

  @override
  State<Sura_detals> createState() => _Sura_detalsState();
}

class _Sura_detalsState extends State<Sura_detals> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as nameofsura;
    if (ayat.isEmpty) {
      loadfile(args.index);
    }
    return Container(
      decoration: provider.darkmode()
          ? BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/darkquran.png'),
                  fit: BoxFit.fill))
          : BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/quran.png'),
                  fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('${args.name}',
              style: TextStyle(
                  color: provider.darkmode()
                      ? Themedata.yellowcolor
                      : Themedata.whitecolor)),
        ),
        body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: provider.darkmode()
                  ? Themedata.primarydark
                  : Themedata.whitecolor),
          margin: EdgeInsets.all(20),
          child: ayat.length == 0
              ? Center(
                  child: CircularProgressIndicator(
                  color: provider.darkmode()
                      ? Themedata.primarydark
                      : Themedata.whitecolor,
                ))
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${ayat[index]}(${index + 1})",
                          style: TextStyle(
                              color: provider.darkmode()
                                  ? Themedata.yellowcolor
                                  : Themedata.primarydark),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl),
                    );
                  },
                  itemCount: ayat.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: provider.darkmode()
                          ? Themedata.whitecolor
                          : Themedata.primarylight,
                      thickness: 2,
                    );
                  }),
        ),
      ),
    );
  }

  void loadfile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    ayat = lines;
    setState(() {});
  }
}
