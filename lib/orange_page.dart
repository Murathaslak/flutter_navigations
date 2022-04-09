// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_navigations/purple_page.dart';

class OrangePage extends StatelessWidget {
  const OrangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orange Page"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Orange Page",
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                // İLK STACKE GiDENE KADAR POPLA
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text("En başa geri dön"),
              style: ElevatedButton.styleFrom(primary: Colors.blue.shade600),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (redcontext) => PurplePage()));
              },
              child: Text("Mora git"),
              style: ElevatedButton.styleFrom(primary: Colors.purple.shade600),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    // DİREKT KÖK DİZİNE GİT
                    .popUntil((route) => route.settings.name == "/");
              },
              child: Text("En başa geri dön"),
              style: ElevatedButton.styleFrom(primary: Colors.orange.shade600),
            ),
            ElevatedButton(
              onPressed: () {
                // ANASAYFA İLE ARASINDA Kİ HERŞEYİ POP LA SONRA ANASAYFAN SONRA KENDİNİ PUSHLA
                Navigator.of(context).pushNamedAndRemoveUntil(
                    "/yellowPage", (route) => route.isFirst);
              },
              child: Text("Sarıyı ana sayfadan sonra ekle"),
              style: ElevatedButton.styleFrom(primary: Colors.orange.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
