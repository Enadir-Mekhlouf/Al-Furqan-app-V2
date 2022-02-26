import 'package:flutter/material.dart';
import 'navigation_drawer_widget.dart';

class athkar extends StatelessWidget {
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
                  'Athkar Page',
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
    );
  }
}
