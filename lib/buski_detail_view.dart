import 'package:flutter/material.dart';

class BuskiDetailView extends StatelessWidget {
  final Map<String, dynamic> item; // Detayları alacağımız veri

  BuskiDetailView(this.item); // Constructor ile veri alıyoruz

  @override
  Widget build(BuildContext context) {
    // Verileri ekrana yazdırırken eğer null ise "YOK" yazacağız
    String _getDetailValue(dynamic value) {
      return value != null && value.toString().isNotEmpty
          ? value.toString()
          : "YOK";
    }

    return Scaffold(
      appBar: AppBar(title: Text('Kullanıcı Detayları')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Sayaç Seri Numarası'),
              subtitle: Text(_getDetailValue(item['METER_SERIAL_NUMBER'])),
            ),
            ListTile(
              title: Text('Abone Tipi'),
              subtitle: Text(_getDetailValue(item['SUBSCRIBER_TYPE'])),
            ),
            ListTile(
              title: Text('Depozito'),
              subtitle: Text(_getDetailValue(item['DEPOSIT'])),
            ),
            ListTile(
              title: Text('Başvuru Durumu'),
              subtitle: Text(_getDetailValue(item['APP_STATUS_VALUE'])),
            ),
            ListTile(
              title: Text('Adres'),
              subtitle: Text(_getDetailValue(item['ADDRESS'])),
            ),
            ListTile(
              title: Text('Telefon'),
              subtitle: Text(_getDetailValue(item['PHONE'])),
            ),
            ListTile(
              title: Text('E-posta'),
              subtitle: Text(_getDetailValue(item['MAIL'])),
            ),
            ListTile(
              title: Text('İlk Gaz Açılışı'),
              subtitle: Text(_getDetailValue(item['FIRST_GAS_OPEN'])),
            ),
            ListTile(
              title: Text('Başvuru Tarihi'),
              subtitle: Text(_getDetailValue(item['APP_DATE'])),
            ),
            ListTile(
              title: Text('Adres'),
              subtitle: Text(_getDetailValue(item['ADDRESS'])),
            ),
            // Diğer tüm alanlar burada benzer şekilde eklenebilir
          ],
        ),
      ),
    );
  }
}
