import 'dart:convert';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:quran/surahData.dart';
import 'package:quran_app/qurandata.dart';

import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';

class ReadQuran extends StatefulWidget {
  static String id = 'readquran';
  final int? surahid;
  final int? totalverses;
  final String? surahnamearabic;
  final String? surahname;
  final String? surahtranslation;
  final String? surahtype;
  const ReadQuran(
      {Key? key,
      this.surahid,
      this.totalverses,
      this.surahnamearabic,
      this.surahname,
      this.surahtranslation,
      this.surahtype})
      : super(key: key);
  @override
  State<ReadQuran> createState() => _ReadQuranState();
}

class _ReadQuranState extends State<ReadQuran> {
  int? surahlength;

  Future getapidata() async {
    AudioPlayer audioPlayer = AudioPlayer();

    var response = await http.get(Uri.http(
        "api.quran.com", "api/v4/chapter_recitations/1/${widget.surahid}"));
    var Jsondata = jsonDecode(response.body);
    print(Jsondata['audio_file']);
    Jsondata = Jsondata['audio_file'];
    print(Jsondata);
    quranapi quraninfo = quranapi(Jsondata["id"], Jsondata['file_size'],
        Jsondata['format'], Jsondata['audio_url']);
    print(quraninfo);
    print(quraninfo.audio_url);

    int result = await audioPlayer.play(quraninfo.audio_url);
    if (result == 1) {
      // success

    }
  }

  @override
  Widget build(BuildContext context) {
    int surrah = widget.surahid!.toInt();
    return Scaffold(
      //app bar

      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.purple[300],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Read Quran',
            ),
            GestureDetector(
              child: Icon(
                Icons.play_arrow_rounded,
              ),
              onTap: getapidata,
            ), //TODO:add audio to read all surah
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Card(
                //the surah info "card"
                color: const Color.fromRGBO(239, 231, 250, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                    color: Colors.purple,
                    width: 0.3,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 170,
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          // this row for name of surah in arabic and latin alphabrt
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.surahname.toString(),
                              style: const TextStyle(fontSize: 23),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              widget.surahnamearabic.toString(),
                              style: const TextStyle(fontSize: 23),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          // surah translation name
                          widget.surahtranslation.toString(),
                          style: const TextStyle(fontSize: 15),
                        ),
                        const Divider(
                          color: Colors.black54,
                          height: 20,
                          indent: 80,
                          endIndent: 80,
                        ),
                        Row(
                          // this row for type of surah and how many verses
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.surahtype.toString() + ' ',
                                style: const TextStyle(fontSize: 10)),
                            Text(widget.totalverses.toString() + ' Verses',
                                style: const TextStyle(fontSize: 10)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          '   بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ ',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Uthmanic',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FutureBuilder(
                future: ReadJsonData(),
                builder: (context, data) {
                  if (data.hasError) {
                    return Text("${data.error}");
                  } else if (data.hasData) {
                    var items =
                        data.data as List<Qurandata>; // get json data in items
                    var surahlength =
                        items[surrah - 1].verses!.length; // surah length
                    var verses = items[surrah - 1].verses; // surah verses
                    //var valueMap = jsonDecode(verses);
                    return Expanded(
                      // returning a list view
                      child: ListView.builder(
                        itemCount: surahlength,
                        itemBuilder: (BuildContext context, int index) {
                          ArabicNumbers arabicNumber = ArabicNumbers();
                          var indexNumber = index + 1;
                          var arabicnumber = arabicNumber.convert(
                              indexNumber); // convert ayat number to arabic numbers

                          return Container(
                            // this container is where the ayat will show
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              // column cause we have a card and  two texts arabic and english
                              children: [
                                Card(
                                  // this card is the holder of ayat number and play button of audio ...
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                    side: const BorderSide(
                                      color: Colors.purple,
                                      width: 0.2,
                                    ),
                                  ),
                                  color: const Color.fromRGBO(248, 245, 252, 1),
                                  child: SizedBox(
                                      width: double.infinity,
                                      height: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, top: 4, bottom: 4),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Colors.purple,
                                                  child: Text(
                                                    indexNumber.toString(),
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              //TODO: add audio and copy and share functions
                                              children: const [
                                                Icon(Icons.play_arrow,
                                                    size: 20,
                                                    color: Colors.purple),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(Icons.copy,
                                                    size: 20,
                                                    color: Colors.purple),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(Icons.share,
                                                    size: 20,
                                                    color: Colors.purple),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                Align(
                                  // ayah in arabic text
                                  alignment: Alignment.topRight,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            verses![index].text.toString() +
                                                arabicnumber.toString(),
                                            textAlign: TextAlign.right,
                                            textDirection: TextDirection.rtl,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Uthmanic'),
                                          ),
                                        ),
                                      ]),
                                ),
                                Align(
                                  //ayah in english text
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        bottom: 10.0, top: 5),
                                    child: Text(
                                        verses[index].translation.toString(),
                                        style: const TextStyle()),
                                  ),
                                ),
                              ],
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

class quranapi {
  final int id;
  final double file_size;
  final String format;
  final String audio_url;

  quranapi(this.id, this.file_size, this.format, this.audio_url);
}
