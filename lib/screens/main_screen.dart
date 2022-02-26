import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quran_app/screens/athkar.dart';
import 'package:quran_app/screens/homepage.dart';
import 'bottom_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(
              Icons.settings,
              color: Colors.black,
            ),
            Text(
              'Al Furqan',
              style: TextStyle(color: Colors.black),
            ),
            Icon(
              Icons.menu,
              color: Colors.black,
            )
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: ListView(
            children: <Widget>[
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                    side: BorderSide(color: Colors.purple.shade100)),
                child: const ListTile(
                  leading: Image(
                    image: AssetImage('images/quran-logo.png'),
                  ),
                  title: Text(
                    'Read Quran',
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text('Learn Quran and Recite one everyday',
                      style: TextStyle(color: Colors.black)),
                  isThreeLine: true,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
