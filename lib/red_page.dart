// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print, must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';

class RedPage extends StatelessWidget {
  RedPage({Key? key}) : super(key: key);

  int _rasgeleSayi = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print("On will pop çalıştı");
        if (_rasgeleSayi == 0) {
          _rasgeleSayi = Random().nextInt(100);
          Navigator.pop(context, _rasgeleSayi);
        }
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          title: Text("Red Page"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Red Page",
                style: TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                  onPressed: () {
                    _rasgeleSayi = Random().nextInt(100);
                    print("Uretilen sayi $_rasgeleSayi");
                    Navigator.of(context).pop(_rasgeleSayi);
                  },
                  child: Text("Geri Dön")),
              ElevatedButton(
                onPressed: () {
                  // Sayfanın öncesinde sayfa var mı geri gelebilir mi sorgusunu yapıyor.
                  if (Navigator.canPop(context)) {
                    print("Evet pop olabilir");
                  } else
                    print("Hayır olamaz");
                },
                child: Text("Can Pop Kullanımı"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red.shade600,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/orangePage");
                },
                child: Text("Goto orange"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
