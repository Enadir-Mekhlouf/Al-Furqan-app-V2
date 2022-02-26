import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Httpservice {
  final String url = "https://api.quran.com/api/v4/chapter_recitations/1/1";

  void main(List<String> arguments) async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url =
        Uri.https('https://api.quran.com', '/api/v4/chapter_recitations/1/1');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['audio_url'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

class Audioquran extends StatefulWidget {
  const Audioquran();

  @override
  _AudioquranState createState() => _AudioquranState();
}

class _AudioquranState extends State<Audioquran> {
  final String url = "https://api.quran.com/api/v4/chapter_recitations/1/1";
  @override
  Widget build(BuildContext context) {
    void main(List<String> arguments) async {
      // This example uses the Google Books API to search for books about http.
      // https://developers.google.com/books/docs/overview
      var url =
          Uri.https('https://api.quran.com', '/api/v4/chapter_recitations/1/1');

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        var itemCount = jsonResponse['audio_url'];
        print('Number of books about http: $itemCount.');
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text("hello"),
        ),
      ),
    );
  }
}
