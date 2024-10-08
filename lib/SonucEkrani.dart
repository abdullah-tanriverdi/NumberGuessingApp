import 'dart:math';

import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  // const SonucEkrani({super.key});

  late bool sonuc;
  SonucEkrani({required this.sonuc});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Sonuç Ekranı"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              widget.sonuc
                  ? Image.asset("resimler/mutlu_resim.png")
                  : Image.asset("resimler/uzgun_resim.png"),
              Text(
                widget.sonuc ? "Kazandınız" : "Kaybettiniz",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 36,
                ),
              ),
              SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    child: Text("Tekrar dene"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ))
            ],
          ),
        ));
  }
}
