import 'dart:convert';

class Verse {
  Verse({
    this.id,
    this.text,
    this.translation,
  });

  int? id;
  String? text;
  String? translation;

  factory Verse.fromRawJson(String str) => Verse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        id: json["id"],
        text: json["text"],
        translation: json["translation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "translation": translation,
      };
}
