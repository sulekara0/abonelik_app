import 'package:get/get.dart';
import 'ApiService.dart';

class BuskiController extends GetxController {
  var buskiData = RxList<Map<String, dynamic>>(); // Veri tutma (liste)
  var isLoading = false.obs; // Yükleniyor durumu

  final ApiService apiService = ApiService();

  // Sabit URL ile veri çekme fonksiyonu
  Future<void> fetchBuskiData() async {
    isLoading(true); // Yükleme başladı
    try {
      var data = await apiService.getBuskiData(); // Veri çekme
      if (data.isNotEmpty) {
        buskiData.value = data; // Gelen veriyi listeye ata
      } else {
        print('Veri boş!'); // Eğer veri boşsa
        buskiData.value = []; // Boş veri geldiğinde
      }
    } catch (e) {
      print('Hata: $e'); // Hata mesajını yazdır
    } finally {
      isLoading(false); // Yükleme tamamlandı
    }
  }
}
