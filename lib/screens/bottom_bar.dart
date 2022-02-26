import 'package:flutter/material.dart';
import 'package:quran_app/audio.dart';
import 'package:quran_app/main.dart';
import 'package:quran_app/screens/athkar.dart';
import 'package:quran_app/screens/hadith.dart';
import 'package:quran_app/screens/homepage.dart';
import 'package:quran_app/screens/read_quran.dart';

class BottomBar extends StatelessWidget {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    void _onItemTab(int index) {
      _currentIndex = index;
      switch (index) {
        case 0:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Homepage()));
          break;
        case 1:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Audioquran()));
          break;
        case 2:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => athkar()));
          break;
        case 3:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => hadith()));
          break;
      }
    }

    return Container(
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple.shade700,
        unselectedItemColor: Colors.purple.shade900,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(
              label: "Quraan", icon: Icon(Icons.book_online_sharp)),
          BottomNavigationBarItem(
            label: 'Tafsir',
            icon: Icon(Icons.book_online),
          ),
          BottomNavigationBarItem(
            label: 'athkar',
            icon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            label: 'Hadith',
            icon: Icon(Icons.library_books),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTab,
      ),
    );
  }
}
