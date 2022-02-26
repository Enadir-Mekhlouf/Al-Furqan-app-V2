import 'package:quran_app/versesdata.dart';

class Qurandata {
  int? id;
  String? name;
  String? transliteration;
  String? translation;
  String? type;
  int? totalverses;
  List<Verse>? verses;
  String? text;
  Qurandata({
    this.id,
    this.name,
    this.transliteration,
    this.translation,
    this.type,
    this.totalverses,
    this.verses,
    this.text,
  });

  factory Qurandata.fromJson(Map<String, dynamic> json) => Qurandata(
        id: json["id"],
        name: json["name"],
        transliteration: json["transliteration"],
        translation: json["translation"],
        type: json["type"],
        totalverses: json["total_verses"],
        verses: List<Verse>.from(json["verses"].map((x) => Verse.fromJson(x))),
      );
}
