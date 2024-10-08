import 'package:flutter/material.dart';
import 'package:numberguessingapp/tahminekrani.dart';

void main() {
  // Uygulamayı başlatır
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // Uygulama başlığı
      debugShowCheckedModeBanner: false, // Debug bandını gizle
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Tema rengi
        useMaterial3: true, // Material 3 tasarımını kullan
      ),
      home: AnaSayfa(), // Ana sayfa olarak AnaSayfa widget'ını ayarla
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context)
            .colorScheme
            .inversePrimary, // Uygulama çubuğu rengi
        title: Text("Ana Sayfa"), // Uygulama çubuğundaki başlık
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, // Elemanları dikey olarak dağıt
          children: [
            Text(
              "Tahmin Oyunu", // Oyun başlığı
              style: TextStyle(
                color: Colors.black54, // Yazı rengi
                fontSize: 36, // Yazı boyutu
              ),
            ),
            Image.asset("resimler/zar_resim.png"), // Resim dosyasını ekle
            SizedBox(
              width: 200, // Butonun genişliği
              height: 50, // Butonun yüksekliği
              child: ElevatedButton(
                child: Text("OYUNA BAŞLA"), // Buton üzerindeki yazı
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue, // Buton arka plan rengi
                  foregroundColor: Colors.white, // Buton yazı rengi
                ),
                onPressed: () {
                  // Butona tıklandığında Tahminekrani sayfasına geçiş yap
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Tahminekrani(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
