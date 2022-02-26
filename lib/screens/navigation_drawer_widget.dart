import 'package:flutter/material.dart';
import 'package:quran_app/screens/athkar.dart';
import 'package:quran_app/screens/getstarted.dart';
import 'package:quran_app/screens/hadith.dart';
import 'package:quran_app/screens/homepage.dart';
import 'package:quran_app/screens/main_screen.dart';
import 'package:quran_app/screens/read_quran.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
      color: Color(0xFF3594D8),
      child: Container(
          padding: padding,
          child: Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildSearchField(),
                BuildMenuItem(
                    text: 'Home',
                    icon: Icons.favorite_sharp,
                    onClicked: () => selectedItem(context, 0)),
                BuildMenuItem(
                    text: 'Read Quran',
                    icon: Icons.bookmarks_sharp,
                    onClicked: () => selectedItem(context, 1)),
                BuildMenuItem(
                    text: 'Athkar',
                    icon: Icons.book_rounded,
                    onClicked: () => selectedItem(context, 2)),
                BuildMenuItem(
                    text: 'Hadith',
                    icon: Icons.pending,
                    onClicked: () => selectedItem(context, 3)),
                BuildMenuItem(
                    text: 'New updates',
                    icon: Icons.update,
                    onClicked: () => selectedItem(context, 4)),
                Divider(color: Colors.white70),
                BuildMenuItem(
                    text: 'Plugins',
                    icon: Icons.account_tree_outlined,
                    onClicked: () => selectedItem(context, 5)),
                BuildMenuItem(
                    text: 'Notifications',
                    icon: Icons.notifications_on_outlined,
                    onClicked: () => selectedItem(context, 6)),
              ],
            ),
          )),
    ));
  }

  Widget buildSearchField() {
    final color = Colors.white;
    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget BuildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hovercolor = Colors.white70;
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hovercolor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MainScreen()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ReadQuran()));
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
}
