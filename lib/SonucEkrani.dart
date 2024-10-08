import 'dart:math'; // Rastgele sayı üretmek için gerekli

import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  // const SonucEkrani({super.key});

  late bool sonuc; // Kazanma ya da kaybetme sonucunu tutan değişken
  SonucEkrani(
      {required this.sonuc}); // Yapıcı metod, sonuc değerini zorunlu kılar

  @override
  State<SonucEkrani> createState() => _SonucEkraniState(); // State oluşturma
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context)
              .colorScheme
              .inversePrimary, // Uygulama çubuğu rengi
          title: Text("Sonuç Ekranı"), // Ekranın başlığı
        ),
        body: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Elemanları dikey olarak ortala
            children: [
              widget
                      .sonuc // Sonuç doğruysa mutlu, yanlışsa üzgün resmini göster
                  ? Image.asset(
                      "resimler/mutlu_resim.png") // Kazanma durumu resmi
                  : Image.asset(
                      "resimler/uzgun_resim.png"), // Kaybetme durumu resmi
              Text(
                widget.sonuc
                    ? "Kazandınız"
                    : "Kaybettiniz", // Sonuca göre metin
                style: TextStyle(
                  color: Colors.black54, // Metin rengi
                  fontSize: 36, // Metin boyutu
                ),
              ),
              SizedBox(
                width: 200, // Buton genişliği
                height: 50, // Buton yüksekliği
                child: ElevatedButton(
                  child: Text("Tekrar dene"), // Buton üzerindeki yazı
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue, // Buton arka plan rengi
                    foregroundColor: Colors.white, // Buton yazı rengi
                  ),
                  onPressed: () {
                    Navigator.pop(
                        context); // Tekrar dene butonuna basıldığında önceki ekrana dön
                  },
                ),
              )
            ],
          ),
        ));
  }
}
