// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, curly_braces_in_flow_control_structures, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigations/green_page.dart';
import 'package:flutter_navigations/ogrenci_listesi.dart';
import 'package:flutter_navigations/orange_page.dart';
import 'package:flutter_navigations/red_page.dart';
import 'package:flutter_navigations/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      //home: AnaSayfa(),
      /*
      routes: {
        '/redPage': (context) => RedPage(),
        //Bu kök dizin demek burada kök dizin home da verilmiştir.
        //Bu rotayı kullanmak için home silinmeli
        '/': (context) => AnaSayfa(),
        '/orangePage': (context) => OrangePage(),
      },*/
      /******************************************************************************* */
      //Eğer tanımlanmayan bir rota verilirse bu fonksiyon çalışır. 404 NOT FOUND SAYFASI
      /*
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text("ERROR")),
          body: Center(
            child: Text("Hata"),
          ),
        ),
      ),*/
      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator Kullanımları'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                int? _gelenSayi = await Navigator.push<int>(context,
                    CupertinoPageRoute(builder: (redContext) => RedPage()));
                print("Anasayfadaki sayı $_gelenSayi");
              },
              child: Text("Kırmızı Sayfaya Gir IOS"),
              style: ElevatedButton.styleFrom(
                primary: Colors.red.shade300,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //Navigator.push(context, route);
                Navigator.of(context)
                    .push<int>(
                      MaterialPageRoute(builder: (redcontext) => RedPage()),
                    )
                    .then((int? value) => debugPrint("Gelen sayı $value"));
              },
              child: Text("Kırmızı Sayfaya Gir Android"),
              style: ElevatedButton.styleFrom(
                primary: Colors.red.shade600,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //pop yabiliyorsan yap Future true ver, yapamıyorsan Future false ver
                //geçmiş gezinti varmı varsa açar ve future true dondurur, yoksa acmaz future false döndürür,
                Navigator.of(context).maybePop();
              },
              child: Text("Maybe Pop Kullanımı"),
              style: ElevatedButton.styleFrom(
                primary: Colors.red.shade600,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Sayfa geri gidebilir mi daha onu sorgular
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
                Navigator.of(context)
                    //Stakte anasayfa en altta olur
                    //Push Replacament kullanınca en alta kendini koyar
                    //Login den giriş yaptığımızı Anasayfa ya geçtiğimizi düşünelim
                    //Giriş başarılı olduğunda kullanıcı bida geri yaparsa uygulamadan cıkmalı
                    //Login sayfasına dönememeli burada bu yönlendirme kullanılır
                    .pushReplacement(
                        MaterialPageRoute(builder: (context) => GreenPage()));
              },
              child: Text("Push Replacament Kullanımı"),
              style: ElevatedButton.styleFrom(
                primary: Colors.green.shade600,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //Navigator.of(context).pushNamed("redPage");
                //Yukarda routes tanımlarında nasıl tanımlarsa buraya o şekilde yazarız
                //onUnknownRoute, routes yazılmamışsa devreye girer hata sayfasına yönlendirir
                Navigator.pushNamed(context, '/orangePage');
              },
              child: Text("PushNamed Kullanımı"),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange.shade600,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //Navigator.of(context).pushNamed("redPage");
                //Yukarda routes tanımlarında nasıl tanımlarsa buraya o şekilde yazarız
                //onUnknownRoute, routes yazılmamışsa devreye girer hata sayfasına yönlendirir
                Navigator.pushNamed(context, '/yellowPage');
              },
              child: Text("PushNamed Kullanımı"),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow.shade600,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed("/ogrenciListesi", arguments: 20);
              },
              child: Text("Liste Oluştur"),
              style: ElevatedButton.styleFrom(
                primary: Colors.pink.shade600,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/purplePage", arguments: 20);
              },
              child: Text("Mor Sayfaya Git"),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
