import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/abbscreens/quran/suraname-details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/provider/abbconfigprovider.dart';
import 'package:untitled/themedata.dart';

class Quran extends StatelessWidget {
  static List<String> namelist = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    return Column(
      children: [
        Center(child: Image.asset('assets/images/image_quran.png')),
        Divider(
          color: provider.darkmode()
              ? Themedata.yellowcolor
              : Themedata.primarylight,
          thickness: 2,
        ),
        Text(
          AppLocalizations.of(context)!.suraname,
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
                onTap: () {
                  Navigator.of(context).pushNamed(Sura_detals.routname,
                      arguments:
                          nameofsura(name: namelist[index], index: index));
                },
                child: Text(
                  namelist[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).primaryTextTheme.headline3,
                ));
          },
          itemCount: namelist.length,
        ))
      ],
    );
  }
}

class nameofsura {
  String name;
  int index;

  nameofsura({required this.name, required this.index});
}
