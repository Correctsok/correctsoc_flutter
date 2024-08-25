import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<dynamic> getAdvertisements() async {
    final response = await _dio.get(
      'http://correctsocandroidapi.somee.com/api/User/GetAdvertisements',
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to load advertisements');
    }
  }
}
