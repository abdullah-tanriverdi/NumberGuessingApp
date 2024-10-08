import 'dart:math'; // Rastgele sayılar için gerekli kütüphane
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberguessingapp/SonucEkrani.dart'; // Sonuç ekranı için gerekli kütüphane

class Tahminekrani extends StatefulWidget {
  const Tahminekrani({super.key});

  @override
  State<Tahminekrani> createState() => _TahminekraniState();
}

class _TahminekraniState extends State<Tahminekrani> {
  var tfTahmin =
      TextEditingController(); // Kullanıcı tahmini için metin kontrolü
  int randomSayi = 0; // Rastgele sayıyı tutacak değişken
  int kalanHak = 5; // Kullanıcının kalan hak sayısı
  String yonlendirme = ""; // Kullanıcıya verilen yönlendirme mesajı

  @override
  void initState() {
    super.initState();
    randomSayi =
        Random().nextInt(21); // 0 ile 20 arasında rastgele bir sayı üret
    print("Rastgele Sayı: $randomSayi"); // Rastgele sayıyı konsola yazdır
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tahmin Ekranı"), // Uygulama çubuğundaki başlık
        ),
        body: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Elemanları dikey olarak dağıt
            children: [
              Text(
                "Kalan Hak: $kalanHak ", // Kullanıcının kalan hak sayısını göster
                style: TextStyle(color: Colors.pink, fontSize: 30),
              ),
              Text(
                "Yardım: $yonlendirme", // Kullanıcıya verilen yönlendirme mesajı
                style: TextStyle(color: Colors.black54, fontSize: 24),
              ),
              Padding(
                padding:
                    const EdgeInsets.all(8.0), // TextField için padding ekle
                child: TextField(
                  controller:
                      tfTahmin, // Kullanıcının girdiği tahmin metnini kontrol et
                  keyboardType:
                      TextInputType.number, // Sayı girişi için klavye türü
                  textAlign: TextAlign.center, // Metni ortala
                  decoration: InputDecoration(
                    labelText: "Tahmin", // TextField etiket metni
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // Kenar yuvarlama
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 200, // Butonun genişliği
                height: 50, // Butonun yüksekliği
                child: ElevatedButton(
                  onPressed: () {
                    if (tfTahmin.text.isEmpty) {
                      // Kullanıcı tahmin girmemişse
                      setState(() {
                        yonlendirme = "Tahmin Girin"; // Uyarı mesajı
                      });
                      return;
                    }

                    setState(() {
                      kalanHak = kalanHak - 1; // Kalan hakkı bir azalt
                    });
                    int tahmin = int.parse(
                        tfTahmin.text); // Tahmin metnini tamsayıya çevir

                    if (tahmin == randomSayi) {
                      // Kullanıcı doğru tahmin ettiyse
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SonucEkrani(
                                    sonuc:
                                        true, // Sonuç ekranına doğru tahmin bilgisi ile geç
                                  )));
                      return;
                    }

                    if (tahmin >= randomSayi) {
                      // Tahmin rastgele sayıdan büyük veya eşitse
                      setState(() {
                        yonlendirme = "TAHMİNİ AZALT"; // Yönlendirme mesajı
                      });
                    }

                    if (tahmin <= randomSayi) {
                      // Tahmin rastgele sayıdan küçük veya eşitse
                      setState(() {
                        yonlendirme = "TAHMİNİ ARTTIR"; // Yönlendirme mesajı
                      });
                    }

                    if (kalanHak == 0) {
                      // Kullanıcının hakkı kalmadıysa
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SonucEkrani(
                                    sonuc:
                                        false, // Sonuç ekranına yanlış tahmin bilgisi ile geç
                                  )));
                    }

                    tfTahmin.text = ""; // TextField'ı sıfırla
                  },
                  child: Text("Tahmin Et"), // Buton üzerindeki yazı
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink, // Buton arka plan rengi
                      foregroundColor: Colors.white), // Buton yazı rengi
                ),
              )
            ],
          ),
        ));
  }
}
