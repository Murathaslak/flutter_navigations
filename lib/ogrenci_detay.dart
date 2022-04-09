import 'package:flutter/material.dart';
import 'package:flutter_navigations/ogrenci_listesi.dart';

class OgrenciDetay extends StatelessWidget {
  final Ogrenci secilenOgrenci;

  const OgrenciDetay({required this.secilenOgrenci, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Diğer yakalama yolu
    //var secilen = ModalRoute.of(context)!.settings.arguments as Ogrenci;

    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci detay"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(secilenOgrenci.id.toString()),
            Text(secilenOgrenci.isim),
            Text(secilenOgrenci.soyisim),
          ],
        ),
      ),
    );
  }
}
