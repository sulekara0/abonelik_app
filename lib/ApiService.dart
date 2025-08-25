import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      'http://10.4.1.35/gui/services/edevletV2/getApplicationTracing/333/06A25FDEA5665B45D06DD7A195E1C7E2/23123619300/0'; // Sabit URL

  Future<List<Map<String, dynamic>>> getBuskiData() async {
    try {
      final response = await http
          .get(Uri.parse(baseUrl))
          .timeout(Duration(seconds: 20)); // Timeout süresi 20 saniye

      print('API Yanıtı: ${response.body}'); // Yanıtı konsola yazdırıyoruz

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var data = json.decode(response.body); // JSON verisini çözümle

        if (data['status'] == 'OK' &&
            data['data'] != null &&
            data['data'].isNotEmpty) {
          print(
            'Veri bulundu: ${data['data']}',
          ); // Burada gelen veri yazdırılır
          return List<Map<String, dynamic>>.from(data['data']);
        } else {
          throw Exception('Veri bulunamadı');
        }
      } else {
        throw Exception('Veri alınamadı. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Hata Detayları: $e');
      rethrow; // Hata detaylarını tekrar fırlat
    }
  }
}
