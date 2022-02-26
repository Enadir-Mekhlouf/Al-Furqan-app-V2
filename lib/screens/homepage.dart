import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quran_app/screens/read_quran.dart';
import 'navigation_drawer_widget.dart';
import 'package:quran_app/qurandata.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'bottom_bar.dart';
import 'athkar.dart';
import 'hadith.dart';
import 'read_quran.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  static String id = 'homepage';

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;
  String surahnamelastread = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.purple[300],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Text(
                  'Al Furqan',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            const Icon(
              Icons.search,
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.9],
                      colors: [
                        Color.fromRGBO(203, 134, 250, 1),
                        Color.fromRGBO(180, 112, 251, 1),
                      ],
                    ),
                    //color: Color.fromRGBO(184, 130, 245, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  height: 150,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: const [
                              Image(
                                image: AssetImage(
                                  'images/quran-logo.png',
                                ),
                                height: 10,
                                width: 10,
                              ), // open book image
                              Text('Last read')
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 50),
                          ),
                          Text(surahnamelastread),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text('Ayat No : 1'),
                        ],
                      ),
                      const Image(
                        image: AssetImage(
                          'images/quran-logo.png',
                        ),
                        height: 50,
                        width: 50,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    child: const Text('Surah'),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.purple,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  //
                  Container(
                    width: double.infinity,
                    child: null,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              FutureBuilder(
                future: ReadJsonData(),
                builder: (context, data) {
                  if (data.hasError) {
                    return Text("${data.error}");
                  } else if (data.hasData) {
                    var items = data.data as List<Qurandata>;
                    var itemlength = items.length;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: itemlength,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                surahnamelastread =
                                    items[index].transliteration.toString();
                              });
                              print(items[index].name);

                              int? surahids = items[index].id;
                              int? totalverses = items[index].totalverses;
                              String? surahnamearabic = items[index].name;
                              String? surahname = items[index].transliteration;
                              String? surahtranslation =
                                  items[index].translation;
                              String? surahtype = items[index].type;
                              print(surahids);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => ReadQuran(
                                    surahid: surahids,
                                    totalverses: totalverses,
                                    surahnamearabic: surahnamearabic,
                                    surahname: surahname,
                                    surahtranslation: surahtranslation,
                                    surahtype: surahtype,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              margin: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        items[index].id.toString(),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            items[index]
                                                .transliteration
                                                .toString(),
                                            textDirection: TextDirection.ltr,
                                          ),
                                          Text(
                                            items[index].type.toString(),
                                            textDirection: TextDirection.ltr,
                                          ),
                                        ],
                                      ), // image
                                    ],
                                  ),
                                  Text(
                                    items[index].name.toString(),
                                    style: const TextStyle(
                                        fontFamily: 'Uthmanic', fontSize: 25),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: BottomBar(),
    );
  }

  Future<List<Qurandata>> ReadJsonData() async {
    //read json file
    final jsondata =
        await rootBundle.rootBundle.loadString('jsonfile/quran.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => Qurandata.fromJson(e)).toList();
  }
}
