import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/abbscreens/7adeth/ahades.dart';
import 'package:untitled/provider/abbconfigprovider.dart';
import 'package:untitled/themedata.dart';

class Hadethdetails extends StatelessWidget {
  static String routname = 'hadethname';

  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Map;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.darkmode()
                  ? 'assets/images/darkquran.png'
                  : 'assets/images/quran.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args['hadethtitle'],
              style: TextStyle(
                  color: provider.darkmode()
                      ? Themedata.yellowcolor
                      : Themedata.primarydark)),
        ),
        body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: provider.darkmode()
                  ? Themedata.primarydark
                  : Themedata.whitecolor),
          margin: EdgeInsets.all(20),
          child: args['hadethcon'] == 0
              ? Center(
                  child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ))
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${args['hadethcon']}",
                          style: TextStyle(
                              color: provider.darkmode()
                                  ? Themedata.yellowcolor
                                  : Themedata.primarydark)),
                    );
                  },
                  itemCount: args['hadethcon'].length,
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
}
