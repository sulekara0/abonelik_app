import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'BuskiView.dart'; // BuskiView'e doğru import ekleyin

void main() {
  runApp(MyApp()); // Ana uygulama fonksiyonu
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Buski Verisi',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BuskiView(), // Girişte gösterilecek ekran
    );
  }
}
