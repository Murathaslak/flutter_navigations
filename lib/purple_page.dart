// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_navigations/orange_page.dart';

class PurplePage extends StatelessWidget {
  const PurplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Purple Page"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Purple Page",
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (redcontext) => OrangePage()));
              },
              child: Text("Turuncu Sayfaya Git"),
              style: ElevatedButton.styleFrom(primary: Colors.orange.shade600),
            )
          ],
        ),
      ),
    );
  }
}
