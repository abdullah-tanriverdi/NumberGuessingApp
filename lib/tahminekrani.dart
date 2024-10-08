import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberguessingapp/SonucEkrani.dart';

class Tahminekrani extends StatefulWidget {
  const Tahminekrani({super.key});

  @override
  State<Tahminekrani> createState() => _TahminekraniState();
}

class _TahminekraniState extends State<Tahminekrani> {
  var tfTahmin = TextEditingController();
  int randomSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "";

  @override
  void initState() {
    super.initState();
    randomSayi = Random().nextInt(21);
    print("Rastgele Sayı: $randomSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tahmin Ekranı"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Kalan Hak: $kalanHak ",
                style: TextStyle(color: Colors.pink, fontSize: 30),
              ),
              Text(
                "Yardım: $yonlendirme",
                style: TextStyle(color: Colors.black54, fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tfTahmin,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: "Tahmin",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (tfTahmin.text.isEmpty) {
                      setState(() {
                        yonlendirme = "Tahmin Girin";
                      });
                      return;
                    }

                    setState(() {
                      kalanHak = kalanHak - 1;
                    });
                    int tahmin = int.parse(tfTahmin.text);

                    if (tahmin == randomSayi) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SonucEkrani(
                                    sonuc: true,
                                  )));
                      return;
                    }

                    if (tahmin >= randomSayi) {
                      setState(() {
                        yonlendirme = "TAHMİNİ AZALT";
                      });
                    }

                    if (tahmin <= randomSayi) {
                      setState(() {
                        yonlendirme = "TAHMİNİ ARTTIR";
                      });
                    }

                    if (kalanHak == 0) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SonucEkrani(
                                    sonuc: false,
                                  )));
                    }

                    tfTahmin.text = "";
                  },
                  child: Text("Tahmin Et"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white),
                ),
              )
            ],
          ),
        ));
  }
}
