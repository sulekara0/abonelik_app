import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'BuskiController.dart';
import 'buski_detail_view.dart'; // Detay sayfasını import et

class BuskiView extends StatefulWidget {
  @override
  _BuskiViewState createState() => _BuskiViewState();
}

class _BuskiViewState extends State<BuskiView> {
  final BuskiController buskiController = Get.put(BuskiController());

  @override
  void initState() {
    super.initState();
    buskiController.fetchBuskiData(); // Sayfa ilk açıldığında veri çekme
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buski Verisi')),
      body: Obx(() {
        if (buskiController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          ); // Yükleniyor göstergesi
        } else if (buskiController.buskiData.isEmpty) {
          return Center(child: Text('Veri bulunamadı.')); // Eğer veri boşsa
        } else {
          var data = buskiController.buskiData;

          return ListView.builder(
            itemCount:
                data.length, // Veri sayısına göre öğe sayısını belirliyoruz
            itemBuilder: (context, index) {
              var item = data[index]; // Her öğe için veriyi alıyoruz

              return Dismissible(
                key: Key(item['METER_SERIAL_NUMBER'].toString()),
                direction:
                    DismissDirection.startToEnd, // Kartı sola kaydırıyoruz
                onDismissed: (direction) {
                  // Kaydırma işlemi sonrasında yapılacak işlem
                  print("Kart kaydırıldı.");
                },
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  elevation: 5, // Kartın gölgesini oluşturuyor
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ), // Köşeleri yuvarlatma
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // Detay sayfasına geçiş
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BuskiDetailView(item), // Detay sayfasına gönder
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sayaç Seri Numarası: ${item['METER_SERIAL_NUMBER']}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text('Abone Tipi: ${item['SUBSCRIBER_TYPE']}'),
                          Text('Depozito: ${item['DEPOSIT']}'),
                          Text('Başvuru Durumu: ${item['APP_STATUS_VALUE']}'),
                          Text('Adres: ${item['ADDRESS']}'),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
