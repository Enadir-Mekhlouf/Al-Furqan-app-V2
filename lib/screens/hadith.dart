import 'package:flutter/material.dart';
import 'package:quran_app/screens/bottom_bar.dart';
import 'navigation_drawer_widget.dart';

class hadith extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.purple[300],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Text(
                  'Hadith Page',
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
        child: Column(),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
